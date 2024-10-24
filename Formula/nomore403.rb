class Nomore403 < Formula
  desc "Tool to bypass 403/40X response codes"
  homepage "https://github.com/devploit/nomore403"
  url "https://github.com/devploit/nomore403/archive/refs/tags/1.0.2.tar.gz"
  sha256 "1fda89e455b1372e718a6028e9576cd8cc5206524897b7a63c5fbe0448832cdf"
  license "MIT"
  head "https://github.com/devploit/nomore403.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/nomore403-1.0.2"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "99ea904a6eb4729f4bb102bb433385f31329de57a963243deebe2e4398145fb6"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "b3382838ca5e1b7ad01c2a13d936e4b36903e1cb051de923a61e4f88e6d9670b"
    sha256 cellar: :any_skip_relocation, ventura:       "02d524c6a3fcd5eab71cf9c1613ed388e51459688e4be8142a995912ee75cb46"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "f1f8a34c979a90800be053de6d3883682ee8b25284126d0b993a5cf2ee5cb628"
  end

  depends_on "go" => :build

  def install
    system "go", "build",
      *std_go_args(ldflags: "-w -s"), "-gcflags=all=-l -B -wb=false"
    doc.install "README.md"
  end
end
