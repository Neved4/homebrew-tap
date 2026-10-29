class Seclists < Formula
  desc "Collection of multiple security wordlists"
  homepage "https://github.com/danielmiessler/SecLists"
  url "https://github.com/danielmiessler/SecLists/archive/refs/tags/2026.2.tar.gz"
  sha256 "696d872f543bbbcdcbed64f1dd73671167b2d0281c074121cf63f3dd6ace386d"
  license "MIT"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/seclists-2026.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "eeff64a9cd5bdf400d7d466f3dc596d46d45eb6636ade97b66a8fb1ea8dc8b14"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6e97c8f93df11f96bedbe51b135f42636b2630232bfd0cc581de63c1a95715a4"
  end

  def install
    pkgshare.install Dir["*"]
  end

  test do
    assert_path_exists pkgshare/"README.md"
  end
end
