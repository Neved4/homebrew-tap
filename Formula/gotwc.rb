class Gotwc < Formula
  desc "Tiny world clock in Go!"
  homepage "https://github.com/Neved4/gotwc"
  url "https://github.com/Neved4/gotwc/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "278fd89508d44e2f867b4cc75677185a458593f900111c0ba4ebbe9276adcb60"
  license "MIT"
  head "https://github.com/Neved4/gotwc.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/gotwc-1.1.1"
    rebuild 2
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1369333331f55b301163b552cea070a0322c941c00c4a2329483b008a151a259"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "0410b4b17960cd44950dfcc13c59ceacd70423cc504e2aad770c1cd8fd123ac0"
    sha256 cellar: :any_skip_relocation, ventura:       "466ce4a07bbbb8a9b08fb9293afb393d868832faeb9b139886ff7fd8831e3eab"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "8fa37ef210230d2f1b911486b0a2378df6a56b8ec1f9054837c35050893d6430"
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
    assert_equal desired_output, shell_output("#{bin}/gotwc -t UTC").strip
  end
end
