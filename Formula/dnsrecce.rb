class Dnsrecce < Formula
  desc "DNS reconnaissance CLI with Google scraping and XML output"
  homepage "https://github.com/Neved4/dnsrecce"
  url "https://github.com/Neved4/dnsrecce/archive/refs/heads/main.tar.gz"
  version "1.3.2"
  sha256 "02449f2e3ef9a89c8688434e21a4ce2ffeb241e54b43bf8eb26ac81d583c7c6f"
  license "MIT"
  head "https://github.com/Neved4/dnsrecce.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(
      output:   bin/"dnsrecce",
      ldflags:  "-s -w",
      trimpath: true,
    ), "./cmd/dnsrecce"

    pkgshare.install Dir["data/*"]
    man1.install "doc/man/dnsrecce.1"

    (bin/"dnsrecce").write_env_script bin/"dnsrecce",
      DNSRECCE_DATA: pkgshare
  end

  test do
    help_output = shell_output("#{bin}/dnsrecce --help")
    assert_includes help_output, "Usage: dnsrecce"
  end
end
