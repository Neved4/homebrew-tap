class Gotwc < Formula
  desc "Tiny world clock in Go!"
  homepage "https://github.com/Neved4/gotwc"
  url "https://github.com/Neved4/gotwc/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "2ada413dc14d2aede39da5dc79030260623ca91e4abbe0f5b648f700736dfec5"
  license "MIT"
  head "https://github.com/Neved4/gotwc.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/gotwc-1.1.1"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "dc01fc4d76c72d2ab791c459aac24b8e0acbefe9dd8356f174c94dde117b1ef5"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "4d1847db17f7791eb1cce33d0cd59c1cd73df3fba3ddb870107a20a99cbdba97"
    sha256 cellar: :any_skip_relocation, ventura:       "89b97efe5ad8ea088f0fbfea74fb5e71d5ad45a0222acc388101498c9698050c"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "e37ef0fb43cfab724f1e5acc593c36d4dc6721829fc2b65a87d327f89b33c318"
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
