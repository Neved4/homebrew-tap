class Wordtidy < Formula
  desc "Combine and clean word lists"
  homepage "https://github.com/sts10/tidy"
  url "https://github.com/sts10/tidy/archive/refs/tags/v0.3.24.tar.gz"
  sha256 "dbe180e9a6ea97d472881dcba0059c19135ef2b110e13b1827a7a8e8772de113"
  license "MIT"
  head "https://github.com/sts10/tidy.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/wordtidy-0.3.24"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "4f7b9113ec306458676755bd9bf00be00fec0804178228b5d228f40444d8e929"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5d03b8cc67cf95eda3bf13ae5c6a71042e9dbcd84bb31e268016155890a18333"
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
