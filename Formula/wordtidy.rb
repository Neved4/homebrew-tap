class Wordtidy < Formula
  desc "Combine and clean word lists"
  homepage "https://github.com/sts10/tidy"
  url "https://github.com/sts10/tidy/archive/refs/tags/v0.3.17.tar.gz"
  sha256 "1e34de32b679b37efdd1986f85a5d466cdb62ee9e52033d1a6acbde03efd5c6d"
  license "MIT"
  head "https://github.com/sts10/tidy.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/wordtidy-0.3.16"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "47f9115d69fb54fdbf7aed7577cbca0b8fd1ed6bd77d0cee85ec5202d74763be"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "890ebce5a557964d96d08fcea1cae9fd83a4b93e06507f07c32b5a3b8f2c1559"
    sha256 cellar: :any_skip_relocation, ventura:       "7ab1411a3e5c4c4c0ba0f3bd904b85fd662e18b61b645bf4c6e850cff35517c5"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "e9da8ed45cf5fa438deb57e7e06d923a3e223a209f4ff90ebab4a04a99650393"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    mv "#{bin}/tidy", "#{bin}/wordtidy" # Avoid conflict with system tidy
    doc.install "readme.markdown"
  end

  test do
    desired_output = "tidy #{version}"
    assert_equal desired_output, shell_output("#{bin}/wordtidy --version").strip
  end
end
