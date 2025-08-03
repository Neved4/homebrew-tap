class Wordtidy < Formula
  desc "Combine and clean word lists"
  homepage "https://github.com/sts10/tidy"
  url "https://github.com/sts10/tidy/archive/refs/tags/v0.3.17.tar.gz"
  sha256 "1e34de32b679b37efdd1986f85a5d466cdb62ee9e52033d1a6acbde03efd5c6d"
  license "MIT"
  head "https://github.com/sts10/tidy.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/wordtidy-0.3.17"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "50aca078d786dc1918ed3bb0458543390ce6a41f8f834918ca3b84dec3c455d5"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "f31df42a77a93dd402f476c3e4a6ee2d3ad148f7d84108151d451c42d2e17bf8"
    sha256 cellar: :any_skip_relocation, ventura:       "3b069f1de924a54cefe5dab52275ae112a5bbdee0dce06afc9a344e1060f4bcd"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "70553c0c0be841c75a97d484740de151f907d996d9a142008af7c42ebba3060f"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    bin.install "target/release/tidy" => "wordtidy"
    doc.install "readme.markdown"
  end

  test do
    desired_output = "tidy #{version}"
    assert_equal desired_output, shell_output("#{bin}/wordtidy --version").strip
  end
end
