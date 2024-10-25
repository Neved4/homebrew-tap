class Nomore403 < Formula
  desc "Tool to bypass 403/40X response codes"
  homepage "https://github.com/devploit/nomore403"
  url "https://github.com/devploit/nomore403/archive/refs/tags/1.0.2.tar.gz"
  sha256 "1fda89e455b1372e718a6028e9576cd8cc5206524897b7a63c5fbe0448832cdf"
  license "MIT"
  head "https://github.com/devploit/nomore403.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/nomore403-1.0.2"
    rebuild 2
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "dbd53634bb39915fe6e2ee6e258a3d0128954b3b51f458ee767713b453c0d8b2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "441e81cd9eaff315d4678673a588b78b133d562c65c77c30ab3aed97a45e2565"
    sha256 cellar: :any_skip_relocation, ventura:       "469c44662ba0d53f367ce937b6985d9be5920f3e55bed76cf94b4c56ec9ce4a0"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "ff3ad4084fc1718bd5b5d3a896a3c705456b35b925bb154915de1166616a149a"
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
end
