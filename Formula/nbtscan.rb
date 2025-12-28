class Nbtscan < Formula
  desc "Scan networks for NetBIOS name information"
  homepage "https://github.com/resurrecting-open-source-projects/nbtscan"
  url "https://github.com/resurrecting-open-source-projects/nbtscan/" \
      "archive/refs/tags/1.7.2.tar.gz"
  sha256 "00e61be7c05cd3a34d5fefedffff86dc6add02d4c728b22e13fb9fbeabba1984"
  license "GPL-2.0-or-later"
  head "https://github.com/resurrecting-open-source-projects/nbtscan.git",
    branch: "master"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/nbtscan-1.7.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "92ed8eae86b2b47fa0e741b77c1bcdb442043876f4d330891bad11d84680ed14"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0d4d08db98483cd8fe35e9596e877ca2fa2f5063cc7d1c9f73edcca1be0dd2ec"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "3e4b6f0d1d1d9d596cdd7f7475c992f8cc046a65a9e1a7f60baf0ee3637e08e7"
  end

  depends_on "autoconf" => :build
  depends_on "automake" => :build

  def install
    system "./autogen.sh"
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    output = shell_output(bin/"nbtscan", 2).strip
    assert_match "192.168.0.1:NT_SERVER:00U", output
  end
end
