class TwcGo < Formula
  desc "Tiny world clock in Go!"
  homepage "https://github.com/Neved4/twc-go"
  url "https://github.com/Neved4/twc-go/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "0948a87943e57231be5afc8936be71822e4366f80ae559f4b054c390caaf5fba"
  license "MIT"
  head "https://github.com/Neved4/twc-go.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on "go" => :build
  conflicts_with "twc", because: "both install `twc` binaries"

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "twc.go"
    bin.install_symlink "twc-go" => "twc"
    doc.install "README.md"
  end

  test do
    desired_output = "UTC  " + shell_output('date -u +"%Y-%m-%dT%H:%M:%SZ"').strip
    assert_equal desired_output, shell_output("#{bin}/twc-go -t UTC").strip
  end
end
