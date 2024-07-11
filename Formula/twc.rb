class Twc < Formula
  desc "Tiny world clock in C!"
  homepage "https://github.com/Neved4/twc"
  url "https://github.com/Neved4/twc/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "4712f565f871bcfd32042cd1e0f0829c783814fae143583b11cf922e4b9480fc"
  license "MIT"
  head "https://github.com/Neved4/twc.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on "gcc" => :build

  def install
    system ENV.cc, "-O3", "-std=c99", "twc.c", "-o", "twc"
    bin.install "twc"
    doc.install "README.md"
  end

  test do
    desired_output = shell_output("date -u +'%Y-%m-%d'").strip
    assert_equal desired_output, shell_output("#{bin}/twc -t UTC -s '%Y-%m-%d'").strip
  end
end
