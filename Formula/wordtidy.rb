class Wordtidy < Formula
  desc "Combine and clean word lists"
  homepage "https://github.com/sts10/tidy"
  url "https://github.com/sts10/tidy/archive/refs/tags/v0.3.13.tar.gz"
  sha256 "2a46e4f0e4fa8c8da53f2396680a548ab2de825c9d83c807095b41f450c90e63"
  license "MIT"
  head "https://github.com/sts10/tidy.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/wordtidy-0.3.12"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "95b700f260bcf975bb3ba58b3bf83fb9a2a2ebd88568255bf1c139287d4c732d"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "80a23e375eb4047be7e09268e7a80d38b81b38a099123496979108d54dfd892e"
    sha256 cellar: :any_skip_relocation, ventura:       "7b8a7e7548ba1e429185185ed825e94e54366040bc9c6c9b43f22a78458c90c3"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "49758ab6cff703537eb43bb2d4f8f1f2f40a48df761f0079aba50afce3baec74"
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
