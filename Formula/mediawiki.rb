class Mediawiki < Formula
  desc "Wiki software package written in PHP"
  homepage "https://www.mediawiki.org/"
  url "https://releases.wikimedia.org/mediawiki/1.45/mediawiki-1.45.4.tar.gz"
  sha256 "cb7c824468eb5a511a72f08e6291d09dc8af12e0a0ffdc2532ee3f76bb0cad7c"
  license "GPL-2.0-or-later"

  livecheck do
    url "https://releases.wikimedia.org/mediawiki/#{version.major_minor}/"
    regex(/href=.*?mediawiki[._-]v?(\d+(?:\.\d+)+)\.t/i)
  end

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/mediawiki-1.45.4"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "315f8ebc028aaadc481256efbeb0608eceb90f7ddfa019f5f07fd4b458abec6e"
    sha256 cellar: :any,                 x86_64_linux: "eb6cd0185f623472b4cb77ed5b39b7500de4dbf1df4983a2b87ac98491b3f25b"
  end

  depends_on "autoconf" => :build
  depends_on "composer" => :build
  depends_on "diffutils"
  depends_on "mariadb"
  depends_on "nginx"
  depends_on "php"

  resource "apcu" do
    url "https://pecl.php.net/get/apcu-5.1.28.tgz"
    sha256 "ca9c1820810a168786f8048a4c3f8c9e3fd941407ad1553259fb2e30b5f057bf"

    livecheck do
      url "https://pecl.php.net/rest/r/apcu/latest.txt"
      regex(/^v?(\d+(?:\.\d+)+)$/i)
    end
  end

  def install
    pkgshare.install Dir["*"]
    lua_binaries = pkgshare/"extensions/Scribunto/includes/Engines/LuaStandalone/binaries"
    rm_r lua_binaries if lua_binaries.exist?
    system formula_opt_bin("composer")/"composer", "dump-autoload",
      "--no-dev", "--optimize", "--working-dir=#{pkgshare}"
    build_apcu
    write_mediawiki_nginx_config
    write_mediawiki_server
    (bin/"mediawiki").write_env_script libexec/"mediawiki-server",
      MW_DATA_DIR:              var/"mediawiki",
      MEDIAWIKI_NGINX:          formula_opt_bin("nginx")/"nginx",
      MEDIAWIKI_NGINX_TEMPLATE: libexec/"mediawiki-nginx.conf.template"
  end

  def post_install
    data_dir = var/"mediawiki"
    return if (data_dir/"index.php").exist?

    data_dir.mkpath
    cp_r pkgshare.children, data_dir
  end

  service do
    run [opt_bin/"mediawiki", "8080", "127.0.0.1"]
    keep_alive true
    log_path var/"log/mediawiki.log"
    error_log_path var/"log/mediawiki.log"
  end

  def caveats
    <<~EOS
      Start a local MediaWiki server:
        mediawiki 8080 127.0.0.1

      Then visit:
        http://127.0.0.1:8080/mw-config/index.php

      Database setup notes:
      - Start DB separately: brew services start mariadb (or run mariadbd-safe manually).
      - Ensure DB/user exist and grants are correct for MediaWiki.
      - In installer: host 127.0.0.1, port 3306.

      Default data directory:
        #{var}/mediawiki
    EOS
  end

  def build_apcu
    resource("apcu").stage do
      source_dir = Dir["*"].find { |entry| (Pathname(entry)/"config.m4").exist? } || "."
      cd source_dir do
        system formula_opt_bin("php")/"phpize"
        system "./configure", "--with-php-config=#{formula_opt_bin("php")}/php-config"
        system "make"
        (libexec/"extensions").install "modules/apcu.so"
      end
    end
  end

  def write_mediawiki_nginx_config
    (libexec/"mediawiki-nginx.conf.template").write <<~NGINX
      worker_processes 1;
      events {
          worker_connections 1024;
      }
      http {
          include #{Formula["nginx"].etc}/nginx/mime.types;
          default_type application/octet-stream;
          sendfile on;
          server {
              listen __HOST__:__PORT__;
              root __DOCROOT__;
              index index.php index.html;
              charset utf-8;
              add_header X-Content-Type-Options nosniff always;
              location = /images/README {
                  try_files $uri =404;
              }
              location ~* ^/images/.+\\.(png|jpe?g|gif|webp|svg|bmp|ico|tiff?)$ {
                  try_files $uri =404;
              }
              location ~* ^/images/ {
                  return 403;
              }
              location / {
                  try_files $uri $uri/ /index.php?$query_string;
              }
              location ~ \\.php$ {
                  fastcgi_pass 127.0.0.1:__FPM_PORT__;
                  fastcgi_index index.php;
                  fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
                  include #{Formula["nginx"].etc}/nginx/fastcgi_params;
              }
          }
      }
    NGINX
  end

  def write_mediawiki_server
    (libexec/"mediawiki-server").write <<~SH
      #!/bin/sh
      set -eu

      host="${2:-127.0.0.1}"
      port="${1:-8080}"
      data_dir="${MW_DATA_DIR}"
      nginx_bin="${MEDIAWIKI_NGINX}"
      nginx_template="${MEDIAWIKI_NGINX_TEMPLATE}"
      php_fpm_bin="#{Formula["php"].opt_sbin}/php-fpm"
      apcu_ext="#{libexec}/extensions/apcu.so"
      runtime_dir="${data_dir}/.mediawiki-nginx"
      runtime_conf="${runtime_dir}/nginx.conf"
      fpm_port="${MEDIAWIKI_FPM_PORT:-9000}"
      fpm_conf="${runtime_dir}/php-fpm.conf"

      cleanup() {
        [ -n "${nginx_pid:-}" ] && kill "${nginx_pid}" 2>/dev/null || true
        [ -n "${fpm_pid:-}" ] && kill "${fpm_pid}" 2>/dev/null || true
      }
      trap cleanup INT TERM EXIT

      mkdir -p "${runtime_dir}"
      cat > "${fpm_conf}" <<EOF
      [global]
      daemonize = no
      error_log = ${runtime_dir}/php-fpm.log
      [www]
      listen = 127.0.0.1:${fpm_port}
      pm = static
      pm.max_children = 2
      clear_env = no
      env[PATH] = #{formula_opt_bin("diffutils")}:/usr/bin:/bin:/usr/sbin:/sbin
      catch_workers_output = yes
      EOF
      "${php_fpm_bin}" -F -y "${fpm_conf}" -d "extension=${apcu_ext}" &
      fpm_pid="$!"
      sed -e "s|__HOST__|${host}|g" \
          -e "s|__PORT__|${port}|g" \
          -e "s|__DOCROOT__|${data_dir}|g" \
          -e "s|__FPM_PORT__|${fpm_port}|g" \
          "${nginx_template}" > "${runtime_conf}"

      "${nginx_bin}" -g "daemon off;" -c "${runtime_conf}" &
      nginx_pid="$!"
      wait "${nginx_pid}"
    SH
    chmod 0755, libexec/"mediawiki-server"
  end

  test do
    require "net/http"
    require "uri"

    port = free_port
    fpm_port = free_port
    data_dir = testpath/"mediawiki-data"
    data_dir.mkpath
    cp_r pkgshare.children, data_dir

    nginx_pid = fork do
      ENV["MW_DATA_DIR"] = data_dir.to_s
      ENV["MEDIAWIKI_NGINX"] = formula_opt_bin("nginx")/"nginx"
      ENV["MEDIAWIKI_NGINX_TEMPLATE"] = libexec/"mediawiki-nginx.conf.template"
      ENV["MEDIAWIKI_FPM_PORT"] = fpm_port.to_s
      exec libexec/"mediawiki-server", port.to_s, "127.0.0.1"
    end

    begin
      uri = URI("http://127.0.0.1:#{port}/mw-config/index.php")
      output = nil
      40.times do
        begin
          response = Net::HTTP.start(uri.host, uri.port) { |http| http.get(uri.request_uri) }
          if response.is_a?(Net::HTTPSuccess)
            output = response.body
            break
          end
        rescue Errno::ECONNREFUSED, Errno::EHOSTUNREACH, Errno::ECONNRESET
          nil
        end
        sleep 0.25
      end
      refute_nil output
      assert_match "MediaWiki", output

      css_headers = shell_output("curl -fsS -I http://127.0.0.1:#{port}/resources/lib/codex/codex.style.css")
      assert_match(%r{Content-Type:\s*text/css(?:;\s*charset=utf-8)?}i, css_headers)

      installer_headers = shell_output("curl -fsS -I http://127.0.0.1:#{port}/mw-config/index.php")
      assert_match "X-Content-Type-Options: nosniff", installer_headers

      cookie = testpath/"installer-cookie.txt"
      shell_output("curl -fsS -c #{cookie} 'http://127.0.0.1:#{port}/mw-config/index.php?page=Language' >/dev/null")
      welcome = shell_output("curl -fsSL -b #{cookie} -c #{cookie} -d 'uselang=en' 'http://127.0.0.1:#{port}/mw-config/index.php?page=Language'")
      refute_match "Could not find APCu", welcome
      refute_match "GNU diff3 text comparison utility not found", welcome
      refute_match "Because of a connection error", welcome
      refute_match "vulnerable to arbitrary scripts execution", welcome
    ensure
      Process.kill("TERM", nginx_pid)
      Process.wait(nginx_pid)
    end

    conf = libexec/"mediawiki-nginx.conf.template"
    assert_path_exists conf
    conf_text = conf.read
    assert_match "location ~* ^/images/.+\\.(png|jpe?g|gif|webp|svg|bmp|ico|tiff?)$", conf_text
    assert_match "location ~* ^/images/ {", conf_text
    assert_match "return 403;", conf_text
  end
end
