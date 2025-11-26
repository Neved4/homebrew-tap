class Dnspeek < Formula
  desc "DNS reconnaissance CLI written in Go"
  homepage "https://github.com/Neved4/dnspeek"
  url "https://github.com/Neved4/dnspeek/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "ed5324f16d43921a36177760059796a4a401844dd8d237dd375beb54a8a1f88f"
  license "MIT"
  head "https://github.com/Neved4/dnspeek.git", branch: "main"

  livecheck do
    skip "No tagged version available"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(
      output:  libexec/"dnspeek",
      ldflags: "-s -w",
    ), "./cmd/dnspeek"

    pkgshare.install Dir["data/*"]
    man1.install "doc/man/dnspeek"

    (bin/"dnspeek").write_env_script libexec/"dnspeek",
      DNSPEEK_DATA: pkgshare
  end

  test do
    help_output = shell_output("#{bin}/dnspeek --help")
    assert_match "usage: dnspeek", help_output
  end
end
