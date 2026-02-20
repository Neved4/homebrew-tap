class Mediawiki < Formula
  desc "Wiki software package written in PHP"
  homepage "https://www.mediawiki.org/"
  url "https://releases.wikimedia.org/mediawiki/1.45/mediawiki-1.45.1.tar.gz"
  sha256 "e2f126b19aec422051a0a50e0c6ab7e904f33b3988a47b9da8afbfd0c0a252cc"
  license "GPL-2.0-or-later"

  depends_on "autoconf" => :build
  depends_on "composer" => :build
  depends_on "diffutils"
  depends_on "mariadb"
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
    write_mediawiki_router
    write_mediawiki_server
    (bin/"mediawiki").write_env_script libexec/"mediawiki-server",
      MW_DATA_DIR:      var/"mediawiki",
      MEDIAWIKI_APCU:   libexec/"extensions/apcu.so",
      MEDIAWIKI_PATH:   Formula["diffutils"].opt_bin,
      MEDIAWIKI_PHP:    Formula["php"].opt_bin/"php",
      MEDIAWIKI_ROUTER: libexec/"mediawiki-router.php"
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

  def write_mediawiki_router
    (libexec/"mediawiki-router.php").write <<~PHP
      <?php
      declare(strict_types=1);

      function mediawiki_content_type(string $path): ?string
      {
          $extension = strtolower(pathinfo($path, PATHINFO_EXTENSION));
          $types = [
              'css' => 'text/css; charset=UTF-8',
              'gif' => 'image/gif',
              'html' => 'text/html; charset=UTF-8',
              'ico' => 'image/x-icon',
              'jpeg' => 'image/jpeg',
              'jpg' => 'image/jpeg',
              'js' => 'application/javascript; charset=UTF-8',
              'json' => 'application/json; charset=UTF-8',
              'png' => 'image/png',
              'svg' => 'image/svg+xml',
              'txt' => 'text/plain; charset=UTF-8',
              'webp' => 'image/webp',
              'woff' => 'font/woff',
              'woff2' => 'font/woff2',
          ];

          return $types[$extension] ?? null;
      }

      $docRoot = realpath($_SERVER['DOCUMENT_ROOT'] ?? '.') ?: '.';
      $requestPath = parse_url($_SERVER['REQUEST_URI'] ?? '/', PHP_URL_PATH) ?: '/';
      $candidate = realpath($docRoot . $requestPath);

      if ($candidate && str_starts_with($candidate, $docRoot) && is_file($candidate)) {
          $extension = strtolower(pathinfo($candidate, PATHINFO_EXTENSION));

          if ($extension !== 'php') {
              $contentType = mediawiki_content_type($candidate);
              if ($contentType !== null) {
                  header('Content-Type: ' . $contentType);
              }

              header('X-Content-Type-Options: nosniff');
              readfile($candidate);
              return true;
          }
      }

      header('X-Content-Type-Options: nosniff');
      return false;
    PHP
  end

  def write_mediawiki_server
    (libexec/"mediawiki-server").write <<~SH
      #!/bin/sh
      set -eu

      host="${2:-127.0.0.1}"
      port="${1:-8080}"
      data_dir="${MW_DATA_DIR}"
      apcu_module="${MEDIAWIKI_APCU:-}"
      path_prefix="${MEDIAWIKI_PATH:-}"
      php_bin="${MEDIAWIKI_PHP}"
      router="${MEDIAWIKI_ROUTER}"
      workers="${PHP_CLI_SERVER_WORKERS:-4}"

      if [ -n "${path_prefix}" ]
      then
          PATH="${path_prefix}:${PATH}"
          export PATH
      fi
      export PHP_CLI_SERVER_WORKERS="${workers}"

      if [ -n "${apcu_module}" ] && [ -f "${apcu_module}" ]
      then
          exec "${php_bin}" \
              -d "extension=${apcu_module}" \
              -d apc.enabled=1 \
              -d apc.enable_cli=1 \
              -S "${host}:${port}" \
              -t "${data_dir}" \
              "${router}"
      fi

      exec "${php_bin}" -S "${host}:${port}" -t "${data_dir}" "${router}"
    SH
    chmod 0755, libexec/"mediawiki-server"
  end

  test do
    port = free_port
    data_dir = testpath/"mediawiki-data"
    data_dir.mkpath
    cp_r pkgshare.children, data_dir

    pid = fork do
      ENV["MEDIAWIKI_APCU"] = libexec/"extensions/apcu.so"
      ENV["MW_DATA_DIR"] = data_dir
      ENV["MEDIAWIKI_PATH"] = Formula["diffutils"].opt_bin
      ENV["MEDIAWIKI_PHP"] = Formula["php"].opt_bin/"php"
      ENV["MEDIAWIKI_ROUTER"] = libexec/"mediawiki-router.php"
      exec libexec/"mediawiki-server", port.to_s, "127.0.0.1"
    end

    begin
      sleep 3
      output = shell_output("curl -fsS http://127.0.0.1:#{port}/mw-config/index.php")
      assert_match "MediaWiki", output
      css_headers = shell_output("curl -fsS -I http://127.0.0.1:#{port}/resources/lib/codex/codex.style.css")
      assert_match "Content-Type: text/css", css_headers
      assert_match "X-Content-Type-Options: nosniff", css_headers
    ensure
      Process.kill("TERM", pid)
      Process.wait(pid)
    end
  end
end
