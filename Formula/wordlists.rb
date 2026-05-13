class Wordlists < Formula
  desc "Collection of common wordlists"
  homepage "https://www.kali.org/tools/wordlists/"
  url "https://gitlab.com/kalilinux/packages/wordlists/-/archive/kali/2026.2.0/wordlists-kali-2026.2.0.tar.gz"
  sha256 "ca0e3bda63a5f744635823a2da475c702606d66a61eb53e8f91b06871f30d1f1"
  license :cannot_represent

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/wordlists-2026.2.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "fed1d3f4215cfeb90c56a2ae4283986ed7bb677970e9cb37c3f4a54fae0bb8a3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ed4a0bd7713025c216c382c76e0d396b7a250160a0ed66401244454991d540c7"
  end

  def install
    pkgshare.install Dir["*"]
  end

  test do
    assert_path_exists pkgshare/"README.md"
    assert_path_exists pkgshare/"rockyou.txt.gz"
  end
end
