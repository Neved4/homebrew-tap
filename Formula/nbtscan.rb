class Nbtscan < Formula
  desc "Scan networks for NetBIOS name information"
  homepage "https://github.com/resurrecting-open-source-projects/nbtscan"
  url "https://github.com/resurrecting-open-source-projects/nbtscan/" \
      "archive/refs/tags/1.7.2.tar.gz"
  sha256 "00e61be7c05cd3a34d5fefedffff86dc6add02d4c728b22e13fb9fbeabba1984"
  license "GPL-2.0-or-later"
  head "https://github.com/resurrecting-open-source-projects/nbtscan.git",
    branch: "master"

  depends_on "autoconf" => :build
  depends_on "automake" => :build

  def install
    system "./autogen.sh"
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    version_output = shell_output(bin/"nbtscan").strip
    assert_match "NBTscan version #{version}", version_output
  end
end
