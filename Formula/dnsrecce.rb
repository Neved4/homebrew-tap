class Dnsrecce < Formula
  desc "DNS reconnaissance CLI with Google scraping and XML output"
  homepage "https://github.com/Neved4/dnsrecce"
  url "https://github.com/Neved4/dnsrecce/archive/refs/heads/main.tar.gz"
  version "1.3.2"
  sha256 "e792003010cd40fc7f5834ab45457061182c87469a410495e249fc15224967a7"
  license "MIT"
  head "https://github.com/Neved4/dnsrecce.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/dnsrecce-1.3.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "e03960294c537c6260931527c353096512ce1d193301c928f3b6d9fce6c3130d"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0d0dba37b0ab65617e90a9751c9be93ef9659ae9c9e31498ddf7d235454d2230"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "d663038f8439c552d8a730cdfc9d6ec3281d527e3979442a112130f74bab117f"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(
      output:  libexec/"dnsrecce",
      ldflags: "-s -w",
    ), "./cmd/dnsrecce"

    pkgshare.install Dir["data/*"]
    man1.install "doc/man/dnsrecce.1"

    (bin/"dnsrecce").write_env_script libexec/"dnsrecce",
      DNSRECCE_DATA: pkgshare
  end

  test do
    help_output = shell_output("#{bin}/dnsrecce --help")
    assert_includes help_output, "Usage: dnsrecce"
  end
end
