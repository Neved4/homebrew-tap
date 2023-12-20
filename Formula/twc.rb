class Twc < Formula
  desc "Tiny world clock in C!"
  homepage "https://github.com/Neved4/twc"
  url "https://github.com/Neved4/twc/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "60e4559bfaca94652e18d5df554576aed8b72f550d967c124dc2c1da0b503dc5"
  license "MIT"
  head "https://github.com/Neved4/twc.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on "make" => :build
  conflicts_with "twc-go", because: "both install `twc` binaries"

  def install
    system "make", "twc"
    bin.install "twc"
    doc.install "README.md"
  end

  test do
    desired_output = "UTC  " + shell_output('date -u +"%Y-%m-%dT%H:%M:%SZ"').strip
    assert_equal desired_output, shell_output("#{bin}/twc-go -t UTC").strip
  end
end
