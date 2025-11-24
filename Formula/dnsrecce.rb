class Dnsrecce < Formula
  desc "DNS reconnaissance CLI with Google scraping and XML output"
  homepage "https://github.com/Neved4/dnsrecce"
  url "https://github.com/Neved4/dnsrecce/archive/3db87e811b29f42da83adf4944099642439f39ac.tar.gz"
  version "0.0.0_3db87e811b29f42da83adf4944099642439f39ac"
  sha256 "fb9e1f9f980c5f3bdca77d13bb15de56334b5795f3acd1da39548d877860d22f"
  license "MIT"
  version_scheme 1
  head "https://github.com/Neved4/dnsrecce.git", branch: "main"

  livecheck do
    skip "No tagged version available"
  end

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/dnsrecce-0.0.0_3db87e811b29f42da83adf4944099642439f39ac"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "641c6971b630021f6c92db6077f66cf8d5170875ba0931823ca6d4dd58264eeb"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "94d108674b865ddacf582f8c4c53af8e92628c5339d6e435ab25820cf20c7d78"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "5b71e4916a97f9bbb82ae30088250d35f504db306f00388791ff7e5bc3863310"
  end

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
