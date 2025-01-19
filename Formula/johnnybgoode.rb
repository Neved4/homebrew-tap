class Johnnybgoode < Formula
  desc "Assistant for users of the Johnny Decimal file organization system"
  homepage "https://github.com/SwissArmyWrench/johnnybgoode"
  url "https://github.com/SwissArmyWrench/johnnybgoode/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "049ced703b78656e40ada435934109cc8e4b6fc4be994e8bfff6c313ea762aa8"
  license "MIT"
  head "https://github.com/SwissArmyWrench/johnnybgoode.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/johnnybgoode-1.1.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "203f5b3102d3636b7f0cf50fee3b72243190fe89d6914e31c767b6923c8f84f3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "0ba1f63f0d08040e2780e7eb829cf8fe6fb6940774ed06fb47e928da33c972c2"
    sha256 cellar: :any_skip_relocation, ventura:       "0e3f0991ac6513c997cc0ba70a72206cc26a4f3f6f96081f916038416b9ee6a8"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "c3614074db0fc7a1d2feeee7052e7bfc0e81b899d24e75efd8ac17d8955ca050"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    desired_output = "No such file or directory"
    assert_includes shell_output("#{bin}/johnnybgoode path 11.03 2>&1", 101).strip, desired_output
  end
end
