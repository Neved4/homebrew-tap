class Nomore403 < Formula
  desc "Tool to bypass 403/40X response codes"
  homepage "https://github.com/devploit/nomore403"
  url "https://github.com/devploit/nomore403/archive/refs/tags/1.0.1.tar.gz"
  sha256 "0cdb557ac0515d1b5580f5bcb6045800c13c9868e3f3e8dafcf15f5bc253d013"
  license "MIT"
  head "https://github.com/devploit/nomore403.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on "go" => :build

  def install
    system "go", "build",
      *std_go_args(ldflags: "-w -s") + ["-gcflags=all=-l -B -wb=false"]
    doc.install "README.md"
  end
end
