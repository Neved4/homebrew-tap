class Tidy < Formula
  desc "Combine and clean word lists"
  homepage "https://github.com/sts10/tidy"
  url "https://github.com/sts10/tidy/archive/refs/tags/v0.3.17.tar.gz"
  sha256 "1e34de32b679b37efdd1986f85a5d466cdb62ee9e52033d1a6acbde03efd5c6d"
  license "MIT"
  head "https://github.com/sts10/tidy.git", branch: "main"

  keg_only "conflicts with wordtidy"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_equal "tidy #{version}", shell_output("#{bin}/tidy --version").strip
  end
end
