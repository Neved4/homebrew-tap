require "etc"

class Fcron < Formula
  desc "Periodic command scheduler"
  homepage "https://github.com/yo8192/fcron"
  url "https://github.com/yo8192/fcron/archive/refs/tags/ver3_4_1.tar.gz"
  sha256 "cd25c98ce339317b06895649e460303a6ce19415b6ee8d9b985c68addeb0b8b7"
  license "GPL-2.0-only"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/fcron-3.4.1"
    sha256 arm64_tahoe:  "30d4532ef813a9750a61d4c8da113b8ac9e34df08007dcf44e56bc573b3e4c6d"
    sha256 x86_64_linux: "def796e29e37b0226ce6e81456323be2aebd0d068aaf8182449d61f87a800268"
  end

  depends_on "autoconf" => :build
  depends_on "pkg-config" => :build
  on_linux do
    depends_on "libxcrypt"
  end

  def install
    inreplace "save.c", "fdatasync(fd)", "fsync(fd)" if OS.mac?
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
