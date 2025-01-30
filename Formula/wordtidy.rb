class Wordtidy < Formula
  desc "Combine and clean word lists"
  homepage "https://github.com/sts10/tidy"
  url "https://github.com/sts10/tidy/archive/refs/tags/v0.3.13.tar.gz"
  sha256 "2a46e4f0e4fa8c8da53f2396680a548ab2de825c9d83c807095b41f450c90e63"
  license "MIT"
  head "https://github.com/sts10/tidy.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/wordtidy-0.3.13"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a89458b86025c5af03d5898a5674265be543baaa082c57895880fc80e2517a1d"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "32009f3c3f765e148cd7feb4c82d15f7f014e6d3552779aa9bf21b00dc4c6f51"
    sha256 cellar: :any_skip_relocation, ventura:       "59d633b79db1d0bd954c0e59964e392240804ab767323c1e738edc457dd4c0fe"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "47e64f06b3c665dc9f509c975546091db3bfb34c7ed137d079a2494ad361de0b"
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
