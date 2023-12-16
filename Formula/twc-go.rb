class TwcGo < Formula
  desc "🦦 Tiny world clock in Go!"
  homepage "https://github.com/Neved4/twc-go"
  url "https://github.com/Neved4/twc-go/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "17b260072c87517fc2ce5372ac3c90bf0e73cf83121f3ff919da9488b4e942f6"
  license "MIT"

  head "https://github.com/Neved4/twc-go.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args, "twc.go"
    doc.install "README.md"
  end

  test do
    desired_output = "UTC  " + shell_output('date -u +"%Y-%m-%dT%H:%M:%SZ"').strip
    assert_equal desired_output, shell_output("#{bin}/twc-go -t UTC").strip
  end
end
