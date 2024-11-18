class Wordtidy < Formula
  desc "Combine and clean word lists"
  homepage "https://github.com/sts10/tidy"
  url "https://github.com/sts10/tidy/archive/refs/tags/v0.3.12.tar.gz"
  sha256 "db9956cfa2bafdfb432f5e56225c12acf064d9d65cea74fc56ce270166353cc1"
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
