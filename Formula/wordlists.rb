class Wordlists < Formula
  desc "Collection of common wordlists"
  homepage "https://www.kali.org/tools/wordlists/"
  url "https://gitlab.com/kalilinux/packages/wordlists/-/archive/kali/2026.2.0/wordlists-kali-2026.2.0.tar.gz"
  sha256 "ca0e3bda63a5f744635823a2da475c702606d66a61eb53e8f91b06871f30d1f1"
  license :cannot_represent

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/wordlists-2026.1.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "2433379e98cab577181e02faf0fb5a0f0a1292c05c9875c313fb6693550e13b5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "716af48442ff15bd24bb274eeba9c738cbd9badfef0fe40be262fc6b8060d8e7"
  end

  def install
    pkgshare.install Dir["*"]
  end

  test do
    assert_path_exists pkgshare/"README.md"
    assert_path_exists pkgshare/"rockyou.txt.gz"
  end
end
