class Seclists < Formula
  desc "Collection of multiple security wordlists"
  homepage "https://github.com/danielmiessler/SecLists"
  url "https://github.com/danielmiessler/SecLists/archive/refs/tags/2026.1.tar.gz"
  sha256 "226c49d04974ec6c39dadbf38ba78e67fec8824d729e66907f6050329da98932"
  license "MIT"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/seclists-2025.3"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "b7387a59bb197e148974ef94e6654a10620573ab76ee3ffaaca3efc1f80fcb2e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1317f422346a306552f55abea6c39e18f699e70099348029ab9fd434bdf08b7f"
  end

  def install
    pkgshare.install Dir["*"]
  end

  test do
    assert_path_exists pkgshare/"README.md"
  end
end
