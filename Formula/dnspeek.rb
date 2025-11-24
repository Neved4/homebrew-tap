class Dnspeek < Formula
  desc "DNS reconnaissance CLI written in Go"
  homepage "https://github.com/Neved4/dnspeek"
  url "https://github.com/Neved4/dnspeek/archive/a7ed8a43bad68a8c96036dcb6eac95cc8ba4170e.tar.gz"
  version "0.0.0_a7ed8a43bad68a8c96036dcb6eac95cc8ba4170e"
  sha256 "317cdd4bf9a18c1e67468608ffeb4690adab39a2883a87c61cee1c8f33d8ccd2"
  license "MIT"
  head "https://github.com/Neved4/dnspeek.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(
      output:   libexec/"dnspeek",
      ldflags:  "-s -w",
    ), "./cmd/dnspeek"

    pkgshare.install Dir["data/*"]
    man1.install "doc/man/dnspeek"

    (bin/"dnspeek").write_env_script libexec/"dnspeek",
      DNSPEEK_DATA: pkgshare
  end

  test do
    help_output = shell_output("#{bin}/dnspeek --help")
    assert_includes help_output, "dnspeek - a cozy Go rewrite of dnsrecon"
  end
end
