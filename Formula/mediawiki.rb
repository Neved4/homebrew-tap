class Mediawiki < Formula
  desc "Wiki software package written in PHP"
  homepage "https://www.mediawiki.org/"
  url "https://releases.wikimedia.org/mediawiki/1.45/mediawiki-1.45.1.tar.gz"
  sha256 "e2f126b19aec422051a0a50e0c6ab7e904f33b3988a47b9da8afbfd0c0a252cc"
  license "GPL-2.0-or-later"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/mediawiki-1.45.1"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "96ebf8f48dbcf2b2f5d6e1f33025f288baf796d807cddebd618fe7cea6fe0bc6"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "63e995e6486426a95297bb4cf7d539c177b905f77ca688999147522c548f2f2e"
  end

  depends_on "autoconf" => :build
  depends_on "composer" => :build
  depends_on "diffutils"
  depends_on "mariadb"
  depends_on "nginx"
  depends_on "php"

  resource "apcu" do
    url "https://pecl.php.net/get/apcu-5.1.24.tgz"
    sha256 "5c28a55b27082c69657e25b7ecf553e2cf6b74ec3fa77d6b76f4fb982e001e43"
  end

  def install
    pkgshare.install Dir["*"]
    lua_binaries = pkgshare/"extensions/Scribunto/includes/Engines/LuaStandalone/binaries"
    rm_r lua_binaries if lua_binaries.exist?
    system Formula["composer"].opt_bin/"composer", "dump-autoload",
      "--no-dev", "--optimize", "--working-dir=#{pkgshare}"
    build_apcu
    write_mediawiki_nginx_config
    write_mediawiki_server
    (bin/"mediawiki").write_env_script libexec/"mediawiki-server",
      MW_DATA_DIR:              var/"mediawiki",
      MEDIAWIKI_NGINX:          Formula["nginx"].opt_bin/"nginx",
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

      Default data directory:
        #{var}/mediawiki

      Start PHP-FPM before serving pages:
        brew services start php
    EOS
  end

  def build_apcu
    resource("apcu").stage do
      source_dir = Dir["*"].find { |entry| (Pathname(entry)/"config.m4").exist? } || "."
      cd source_dir do
        system Formula["php"].opt_bin/"phpize"
        system "./configure", "--with-php-config=#{Formula["php"].opt_bin}/php-config"
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
      runtime_dir="${data_dir}/.mediawiki-nginx"
      runtime_conf="${runtime_dir}/nginx.conf"
      fpm_port="${MEDIAWIKI_FPM_PORT:-9000}"

      mkdir -p "${runtime_dir}"
      sed -e "s|__HOST__|${host}|g" \
          -e "s|__PORT__|${port}|g" \
          -e "s|__DOCROOT__|${data_dir}|g" \
          -e "s|__FPM_PORT__|${fpm_port}|g" \
          "${nginx_template}" > "${runtime_conf}"

      exec "${nginx_bin}" -g "daemon off;" -c "${runtime_conf}"
    SH
    chmod 0755, libexec/"mediawiki-server"
  end

  test do
    port = free_port
    fpm_port = free_port
    data_dir = testpath/"mediawiki-data"
    data_dir.mkpath
    cp_r pkgshare.children, data_dir

    fpm_conf = testpath/"php-fpm-mediawiki.conf"
    fpm_log = testpath/"php-fpm-mediawiki.log"
    fpm_conf.write <<~EOS
      [global]
      daemonize = no
      error_log = #{fpm_log}
      [www]
      listen = 127.0.0.1:#{fpm_port}
      pm = static
      pm.max_children = 2
      clear_env = no
      env[PATH] = #{Formula["diffutils"].opt_bin}:/usr/bin:/bin:/usr/sbin:/sbin
      catch_workers_output = yes
    EOS

    fpm_pid = fork do
      exec Formula["php"].opt_sbin/"php-fpm",
        "-F", "-y", fpm_conf, "-d", "extension=#{libexec}/extensions/apcu.so"
    end

    nginx_pid = fork do
      ENV["MW_DATA_DIR"] = data_dir.to_s
      ENV["MEDIAWIKI_NGINX"] = Formula["nginx"].opt_bin/"nginx"
      ENV["MEDIAWIKI_NGINX_TEMPLATE"] = libexec/"mediawiki-nginx.conf.template"
      ENV["MEDIAWIKI_FPM_PORT"] = fpm_port.to_s
      exec libexec/"mediawiki-server", port.to_s, "127.0.0.1"
    end

    begin
      sleep 4
      output = shell_output("curl -fsS http://127.0.0.1:#{port}/mw-config/index.php")
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
      Process.kill("TERM", fpm_pid)
      Process.wait(nginx_pid)
      Process.wait(fpm_pid)
    end

    conf = libexec/"mediawiki-nginx.conf.template"
    assert_path_exists conf
    conf_text = conf.read
    assert_match "location ~* ^/images/.+\\.(png|jpe?g|gif|webp|svg|bmp|ico|tiff?)$", conf_text
    assert_match "location ~* ^/images/ {", conf_text
    assert_match "return 403;", conf_text
  end
end
