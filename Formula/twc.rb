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

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/twc-1.1.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "1b825f603781decd62a82b2074a34de67dbe6265065dbc482650a3ded1797d7f"
    sha256 cellar: :any_skip_relocation, ventura:      "472431c077235005e8531dc9f8fc32b930eb293d12b61842c6ee1657baa4f3a6"
    sha256 cellar: :any_skip_relocation, monterey:     "6d3cc9d479f51ce1689c42957f1b0b2d3ad3c27402ce3d2548e0a62aa278c8e9"
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
