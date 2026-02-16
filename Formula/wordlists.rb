class Wordlists < Formula
  desc "Collection of common wordlists"
  homepage "https://www.kali.org/tools/wordlists/"
  url "https://gitlab.com/kalilinux/packages/wordlists/-/archive/kali/2026.1.2/wordlists-kali-2026.1.2.tar.gz"
  sha256 "9e8e42e753afd4c72be2c07794b5af61cab752a5c3de31a1cce969729c2cca0b"
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
