class Wordlists < Formula
  desc "Collection of common wordlists"
  homepage "https://www.kali.org/tools/wordlists/"
  url "https://gitlab.com/kalilinux/packages/wordlists/-/archive/kali/2025.4.0/wordlists-kali-2025.4.0.tar.gz"
  sha256 "bc30fa77ec18d1c6b25c4fce28664a2f4cc6d35fad5f026907fba0fac2ddc6e9"
  license :cannot_represent

  def install
    pkgshare.install Dir["*"]
  end

  test do
    assert_path_exists pkgshare/"README.md"
    assert_path_exists pkgshare/"rockyou.txt.gz"
  end
end
