class Johnnybgoode < Formula
  desc "Assistant for users of the Johnny Decimal file organization system"
  homepage "https://github.com/SwissArmyWrench/johnnybgoode"
  url "https://github.com/SwissArmyWrench/johnnybgoode/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "35428d4cd22001aa7cee1c7b8a11f4e642eeec68b59c0d20e1130ebb6134728e"
  license "MIT"
  head "https://github.com/SwissArmyWrench/johnnybgoode.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    desired_output = "No such file or directory"
    assert_includes shell_output("#{bin}/johnnybgoode path 11.03 2>&1", 101).strip, desired_output
  end
end
