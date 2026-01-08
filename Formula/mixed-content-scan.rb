class MixedContentScan < Formula
  desc "Scan your HTTPS-enabled website for Mixed Content"
  homepage "https://github.com/bramus/mixed-content-scan"
  url "https://github.com/bramus/mixed-content-scan/archive/refs/tags/2.9.tar.gz"
  sha256 "90ed047f3a074b976e297973c228b7d5cc76ea647f11dec347031b203f8885fe"
  license "MIT"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/mixed-content-scan-2.9"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "9f1b3f62cbb292d8161341c09da57d2f8b9d452216be082dbe59076d37df2724"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "54780b0a4d8ae502bdaaaf8b061a5be970ba52cf73f4adc96f9e3c6680a0fbd5"
  end

  depends_on "composer" => :build
  depends_on "php"

  def install
    system "composer", "install"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/mixed-content-scan"
  end

  test do
    assert_match "usage: mixed-content-scan", shell_output("#{bin}/mixed-content-scan --help")
  end
end
