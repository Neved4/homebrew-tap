class Dnspeek < Formula
  desc "DNS reconnaissance CLI written in Go"
  homepage "https://github.com/Neved4/dnspeek"
  url "https://github.com/Neved4/dnspeek/archive/" \
      "062617e4a4866861d7c1b521f2ff354a3d88d0d4.tar.gz"
  version "0.0.0_062617e4a4866861d7c1b521f2ff354a3d88d0d4"
  sha256 "e3da47f61faeaf16eac95beacc305339d2a79513e84cbfa1e28c8d05fc64c04d"
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
