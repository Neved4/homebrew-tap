class Nbtscan < Formula
  desc "Scan networks for NetBIOS name information"
  homepage "https://salsa.debian.org/pkg-security-team/nbtscan"
  url "https://salsa.debian.org/pkg-security-team/nbtscan/-/archive/upstream/" \
      "1.7.2/nbtscan-upstream-1.7.2.tar.gz"
  sha256 "2adad7f157e036d5a4d175650854c1233409e371d4b796c52ae3c29d5599bb61"
  license "GPL-2.0-or-later"
  head "https://salsa.debian.org/pkg-security-team/nbtscan.git",
    branch: "upstream"

  depends_on "autoconf" => :build
  depends_on "automake" => :build

  def install
    system "./autogen.sh"
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    version_output = shell_output("#{bin}/nbtscan --help").strip
    assert_match "NBTscan version #{version}", version_output
  end
end
