class Johnnybgoode < Formula
  desc "Assistant for users of the Johnny Decimal file organization system"
  homepage "https://github.com/SwissArmyWrench/johnnybgoode"
  url "https://github.com/SwissArmyWrench/johnnybgoode/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "049ced703b78656e40ada435934109cc8e4b6fc4be994e8bfff6c313ea762aa8"
  license "MIT"
  head "https://github.com/SwissArmyWrench/johnnybgoode.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/johnnybgoode-1.2.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "84bee17fd8789a0827204c283dec19724d0f9618c4a67bff44edbece8516cd49"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "9b0098218a2c274a5b884c192b254ae159da71c344b4f8ed9c303d8bbc9c399c"
    sha256 cellar: :any_skip_relocation, ventura:       "b6e7d424174af32091e517981ad079cff43268dcef060873fc415e7ec9b79e35"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "8223b2f15bfca3fdb46eba45de3d5e9443a61d20f97d10f32fb2aed8918d5887"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  # test do
  #   desired_output = "No such file or directory"
  #   assert_includes shell_output("#{bin}/johnnybgoode path 11.03 2>&1", 101).strip, desired_output
  # end
end
