class Tuckr < Formula
  desc "Dotfile manager"
  homepage "https://github.com/RaphGL/Tuckr"
  url "https://github.com/RaphGL/Tuckr/archive/refs/tags/0.12.0.tar.gz"
  sha256 "2b0e359185384bcbc0160a2074dbf4c1e8fdde98c4d1a74ccb0a5af7ec753b00"
  license "GPL-3.0-only"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/tuckr-0.12.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "5443dbb66f5acc1eec18d085b791772def3b3165bbd22b6419235f9936d357f5"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "3eb923037569dee54832f2bcddcb83b33b1d81e2afb279f543fb35aa006c53d4"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "ee26d34b39967dcd8caebed2316ac0174d0a56b78c01071e6bbf800d732554db"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "tuckr", shell_output("#{bin}/tuckr --help")
  end
end
