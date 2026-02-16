class Wordtidy < Formula
  desc "Combine and clean word lists"
  homepage "https://github.com/sts10/tidy"
  url "https://github.com/sts10/tidy/archive/refs/tags/v0.3.24.tar.gz"
  sha256 "dbe180e9a6ea97d472881dcba0059c19135ef2b110e13b1827a7a8e8772de113"
  license "MIT"
  head "https://github.com/sts10/tidy.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/wordtidy-0.3.20"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "263526abac65920695a4ac05bab81f355313b3b7cfffb7246cc88336f5ea3a20"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ade21c178e8c3971c452485945e077a1e86c6e4a6ad42bbf485ff64d79fb234a"
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
