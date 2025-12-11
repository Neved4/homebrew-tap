class Gotwc < Formula
  desc "Tiny world clock in Go!"
  homepage "https://github.com/Neved4/gotwc"
  url "https://github.com/Neved4/gotwc/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "2a2f5984cb8d0bb0a3b3942bded076596399bf1718c21ddde07145a891ba00e7"
  license "MIT"
  head "https://github.com/Neved4/gotwc.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/gotwc-1.2.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "c7253bc77227b2be469a173acdd488acf508977efd8e0f99122ac00b470fe32b"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "538042f252ba5ad551e7b922a884b3900981fd9bca073aa01fdf5bc5dd7f9a81"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "155a36f13b19b42f2121217b86ae87c13fb60d4ae4f5fb4b046ba4c8184df302"
  end

  depends_on "go" => :build

  def install
    system "go", "build",
      *std_go_args(
        ldflags: "-w -s",
        gcflags: "all=-l -B -wb=false",
      )
    doc.install "README.md"
  end

  test do
    desired_output = "UTC  " + shell_output('date -u +"%Y-%m-%dT%H:%M:%SZ"').strip
    assert_equal desired_output, shell_output("#{bin}/gotwc -t UTC -s '%Y-%m-%dT%H:%M:%SZ'").strip
  end
end
