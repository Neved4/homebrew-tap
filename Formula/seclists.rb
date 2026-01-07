class Seclists < Formula
  desc "Collection of multiple security wordlists"
  homepage "https://github.com/danielmiessler/SecLists"
  url "https://gitlab.com/kalilinux/packages/seclists/-/archive/upstream/2025.3-0kali2025.3/seclists-upstream-2025.3-0kali2025.3.tar.gz"
  version "2025.3-0kali1"
  sha256 "73dd0fc383e5e1dab058e9e83b211126713bb2cdfbc1c601c90ac4cc375d1d3e"
  license "MIT"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/seclists-2025.3"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "1cf0bd513b40004f1a62c210bd8129a349893da87284b53c45eca5609b1b2bcb"
  end

  def install
    pkgshare.install Dir["*"]
  end

  test do
    assert_path_exists pkgshare/"README.md"
  end
end
