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

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/nomore403-1.0.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "9be553c613eb550edc8992440d7bce8bdd37cf65cafcd490763e8fbc707fc668"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "1d63db5fc7314b56cda5713c33229ad6e1b1185928aaee5d97ec31be49f2b299"
    sha256 cellar: :any_skip_relocation, ventura:       "4de2039cfcf97066ebefd5b16ab499c6cd9b46c4824906a62253a8f0ed0479a1"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "2417b618d44bd3213c75216935e67e8a07ee4dfdfc0c07e709aef85715d91e15"
  end

  depends_on "go" => :build

  def install
    system "go", "build",
      *std_go_args(ldflags: "-w -s") + ["-gcflags=all=-l -B -wb=false"]
    doc.install "README.md"
  end
end
