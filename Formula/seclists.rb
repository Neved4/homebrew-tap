class Seclists < Formula
  desc "Collection of multiple security wordlists"
  homepage "https://github.com/danielmiessler/SecLists"
  url "https://github.com/danielmiessler/SecLists/archive/refs/tags/2026.2.tar.gz"
  sha256 "696d872f543bbbcdcbed64f1dd73671167b2d0281c074121cf63f3dd6ace386d"
  license "MIT"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/seclists-2026.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "60d3222794a092142f343ba2e3f961bb8ccf65df44ed29de5ac79680599ccdcc"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "676bd17d108d3b980d278d4dcc985e90888b5640066bfaa498aad1e3b5278695"
  end

  def install
    pkgshare.install Dir["*"]
  end

  test do
    assert_path_exists pkgshare/"README.md"
  end
end
