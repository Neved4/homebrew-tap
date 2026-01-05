class Cronie < Formula
  desc "Cron daemon and tools"
  homepage "https://github.com/cronie-crond/cronie"
  url "https://github.com/cronie-crond/cronie/archive/refs/tags/v4.3.tar.gz"
  sha256 "5b6be46e0d24b4efb51d2e7c95d2ded3952cbdf0f4257a1f944de50f2610b210"
  license "ISC"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build

  def install
    ENV.append "CFLAGS", "-Wno-implicit-int"
    system "autoreconf", "-fiv"
    system "./configure", "--prefix=#{prefix}", "--disable-silent-rules"
    system "make", "install"
  end

  test do
    assert_path_exists sbin/"crond"
  end
end
