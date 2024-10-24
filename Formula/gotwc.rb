class Gotwc < Formula
  desc "Tiny world clock in Go!"
  homepage "https://github.com/Neved4/gotwc"
  url "https://github.com/Neved4/gotwc/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "2ada413dc14d2aede39da5dc79030260623ca91e4abbe0f5b648f700736dfec5"
  license "MIT"
  head "https://github.com/Neved4/gotwc.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/gotwc-1.1.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "0b96aee46910236095b17dc66c18dd0ad01ff98e60df6e19fda0fb5d8e5476df"
    sha256 cellar: :any_skip_relocation, ventura:      "850e542f3bb1597add8d88fcc27250d455e7d2643b52493b3907a02cc9ec5f38"
    sha256 cellar: :any_skip_relocation, monterey:     "0b18edf50adcaed63c1d4cb9d1a46e8f6fa7749d3c0ebc557ce64ad4394120df"
  end

  depends_on "go" => :build

  def install
    system "go", "build",
      *std_go_args(ldflags: "-w -s"), "-gcflags=all=-l -B -wb=false"
    doc.install "README.md"
  end

  test do
    desired_output = "UTC  " + shell_output('date -u +"%Y-%m-%dT%H:%M:%SZ"').strip
    assert_equal desired_output, shell_output("#{bin}/gotwc -t UTC").strip
  end
end
