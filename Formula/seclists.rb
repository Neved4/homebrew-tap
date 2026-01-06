class Seclists < Formula
  desc "Collection of multiple security wordlists"
  homepage "https://github.com/danielmiessler/SecLists"
  url "https://gitlab.com/kalilinux/packages/seclists/-/archive/upstream/2025.3-0kali2025.3/seclists-upstream-2025.3-0kali2025.3.tar.gz"
  version "2025.3"
  sha256 "73dd0fc383e5e1dab058e9e83b211126713bb2cdfbc1c601c90ac4cc375d1d3e"
  license "MIT"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/seclists-2025.3"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "7dabd3230bfca73cc276535b3dcf94c08d86fc96f05a27e44013aac481b87df1"
  end

  def install
    pkgshare.install Dir["*"]
  end

  test do
    assert_path_exists pkgshare/"README.md"
  end
end
