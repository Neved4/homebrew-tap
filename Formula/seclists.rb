class Seclists < Formula
  desc "Collection of multiple security wordlists"
  homepage "https://github.com/danielmiessler/SecLists"
  url "https://github.com/danielmiessler/SecLists/archive/refs/tags/2025.3.tar.gz"
  sha256 "8fa88740c36777012f637ebb844de43d1020fb4273e080019d5f0c80360f433f"
  license "MIT"

  def install
    pkgshare.install Dir["*"]
  end

  test do
    assert_path_exists pkgshare/"README.md"
  end
end
