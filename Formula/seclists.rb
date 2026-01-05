class Seclists < Formula
  desc "Collection of multiple security wordlists"
  homepage "https://github.com/danielmiessler/SecLists"
  url "https://gitlab.com/kalilinux/packages/seclists/-/archive/upstream/2025.3/seclists-upstream-2025.3.tar.gz"
  sha256 "fa2c4abff3e1b039a10778ddde43e7bae06710310e3709cc45c9eedc98b377e8"
  license "MIT"

  def install
    pkgshare.install Dir["*"]
  end

  test do
    assert_path_exists pkgshare/"README.md"
  end
end
