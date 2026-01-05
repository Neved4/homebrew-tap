require "etc"

class Fcron < Formula
  desc "Periodic command scheduler"
  homepage "https://github.com/yo8192/fcron"
  url "https://github.com/yo8192/fcron/archive/refs/tags/ver3_4_0.tar.gz"
  sha256 "8dce281ae56ed19f1f37992406f624a71213d5959cbcb5e8199facf34fec085e"
  license "GPL-2.0-only"

  depends_on "autoconf" => :build
  depends_on "pkg-config" => :build

  def install
    system "autoconf"
    user = Etc.getpwuid(Process.uid).name
    group = Etc.getgrgid(Process.gid).name
    system "./configure",
           "--prefix=#{prefix}",
           "--disable-silent-rules",
           "--with-username=#{user}",
           "--with-groupname=#{group}",
           "--with-sendmail=/usr/bin/true"
    %w[en fr].each do |lang|
      (buildpath/"doc/#{lang}/HTML").mkpath
      (buildpath/"doc/#{lang}/txt").mkpath
      (buildpath/"doc/#{lang}/man").mkpath
      (buildpath/"doc/#{lang}/HTML/index.html").write("")
      (buildpath/"doc/#{lang}/txt/readme.txt").write("")
      (buildpath/"doc/#{lang}/man/fcron.8").write("")
    end
    system "make", "install-staged"
  end

  test do
    assert_match "fcrontab", shell_output("#{bin}/fcrontab -V 2>&1")
  end
end
