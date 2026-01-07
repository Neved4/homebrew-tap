class Seclists < Formula
  desc "Collection of multiple security wordlists"
  homepage "https://github.com/danielmiessler/SecLists"
  url "https://github.com/danielmiessler/SecLists/archive/refs/tags/2025.3.tar.gz"
  sha256 "8fa88740c36777012f637ebb844de43d1020fb4273e080019d5f0c80360f433f"
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
