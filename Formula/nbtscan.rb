class Nbtscan < Formula
  desc "Scan networks for NetBIOS name information"
  homepage "https://github.com/resurrecting-open-source-projects/nbtscan"
  url "https://github.com/resurrecting-open-source-projects/nbtscan/" \
      "archive/refs/tags/1.7.2.tar.gz"
  sha256 "2adad7f157e036d5a4d175650854c1233409e371d4b796c52ae3c29d5599bb61"
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
