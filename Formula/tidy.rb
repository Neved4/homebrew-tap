class Tidy < Formula
  desc "Combine and clean word lists"
  homepage "https://github.com/sts10/tidy"
  url "https://github.com/sts10/tidy/archive/refs/tags/v0.3.17.tar.gz"
  sha256 "1e34de32b679b37efdd1986f85a5d466cdb62ee9e52033d1a6acbde03efd5c6d"
  license "MIT"
  head "https://github.com/sts10/tidy.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/tidy-0.3.17"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "9ce01c78622e50bb07a959bb5de8322f1323ab050753f785ccab1f4ac0e2ba6e"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "27003244eb4ecfcc33c2b14c7a639cb5da60379cecc812980307a877efcccb7e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "038b75ea954395d4b5c17ab6684b1207a32b42cf3f390b51717429ced3a37db8"
  end

  keg_only "conflicts with wordtidy"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_equal "tidy #{version}", shell_output("#{bin}/tidy --version").strip
  end
end
