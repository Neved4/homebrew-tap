class Dnsrecce < Formula
  desc "DNS reconnaissance CLI with Google scraping and XML output"
  homepage "https://github.com/Neved4/dnsrecce"
  url "https://github.com/Neved4/dnsrecce/archive/refs/heads/main.tar.gz"
  version "1.3.2"
  sha256 "e792003010cd40fc7f5834ab45457061182c87469a410495e249fc15224967a7"
  license "MIT"
  head "https://github.com/Neved4/dnsrecce.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(
      output:  libexec/"dnsrecce",
      ldflags: "-s -w",
    ), "./cmd/dnsrecce"

    pkgshare.install Dir["data/*"]
    man1.install "doc/man/dnsrecce.1"

    (bin/"dnsrecce").write_env_script libexec/"dnsrecce",
      DNSRECCE_DATA: pkgshare
  end

  test do
    help_output = shell_output("#{bin}/dnsrecce --help")
    assert_includes help_output, "Usage: dnsrecce"
  end
end
