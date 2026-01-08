class MixedContentScan < Formula
  desc "Scan your HTTPS-enabled website for Mixed Content"
  homepage "https://github.com/bramus/mixed-content-scan"
  url "https://github.com/bramus/mixed-content-scan/archive/refs/tags/2.9.tar.gz"
  sha256 "90ed047f3a074b976e297973c228b7d5cc76ea647f11dec347031b203f8885fe"
  license "MIT"

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
