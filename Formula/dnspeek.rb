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

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/dnspeek-0.1.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "2e7d908216b490f41acf2efece7b6f2b80e0e1bbe179823b30d5c5d008eaef45"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "450448196b458d5cdeb8583d4a8c176ec65759fdb4bdaa710813932c01221633"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "bb401dba10ef0a8491c9fb0f706ae55fb5d3dfb5e2734f2dbd5f23103c28a32d"
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
