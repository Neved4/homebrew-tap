class Seclists < Formula
  desc "Collection of multiple security wordlists"
  homepage "https://github.com/danielmiessler/SecLists"
  url "https://gitlab.com/kalilinux/packages/seclists/-/archive/upstream/2025.3-0kali2025.3/seclists-upstream-2025.3-0kali2025.3.tar.gz"
  version "2025.3-0kali1"
  sha256 "73dd0fc383e5e1dab058e9e83b211126713bb2cdfbc1c601c90ac4cc375d1d3e"
  license "MIT"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/seclists-2025.3-0kali1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "d38b54ef82776124c96c4eb78cc0dbdb29796c7699ec28b2c6c7013a0df00a05"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b4ad8ffcf2aa0ef4b1a5c87610b7774b0831ee662e068c19dbef93a571725cc4"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "9db3b205e3d1112a99cf6b64c7836b4aefc7e71b87d9253ee3a61eb57bfd59e3"
  end

  def install
    pkgshare.install Dir["*"]
  end

  test do
    assert_path_exists pkgshare/"README.md"
  end
end
