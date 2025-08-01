class Wordtidy < Formula
  desc "Combine and clean word lists"
  homepage "https://github.com/sts10/tidy"
  url "https://github.com/sts10/tidy/archive/refs/tags/v0.3.17.tar.gz"
  sha256 "1e34de32b679b37efdd1986f85a5d466cdb62ee9e52033d1a6acbde03efd5c6d"
  license "MIT"
  head "https://github.com/sts10/tidy.git", branch: "main"

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
