class Ladybird < Formula
  desc "Truly independent web browser (pre-alpha developer version)"
  homepage "https://ladybird.org/"
  url "https://github.com/LadybirdBrowser/ladybird/archive/b9e7c6a2f66d83c6af73bcc102c05d3056382c02.tar.gz"
  version "0.1.0-b9e7c6a"
  sha256 "855a293849805d89c49cc29fd87a6b3e002f68d633f7ce52065e3260046be54b"
  license "BSD-2-Clause"
  head "https://github.com/LadybirdBrowser/ladybird.git", branch: "master"

  depends_on "autoconf" => :build
  depends_on "autoconf-archive" => :build
  depends_on "automake" => :build
  depends_on "ccache" => :build
  depends_on "cmake" => :build
  depends_on "ffmpeg" => :build
  depends_on "llvm" => :build
  depends_on "nasm" => :build
  depends_on "ninja" => :build
  depends_on "pkg-config" => :build
  depends_on :macos

  def install
    ENV["CC"] = "#{Formula["llvm"].opt_bin}/clang"
    ENV["CXX"] = "#{Formula["llvm"].opt_bin}/clang++"

    system "git", "init"
    system "./Meta/ladybird.sh", "install"

    cd "Build/ladybird/bin/Ladybird.app/Contents" do
      rm_r("./lib")
      cp_r("../../../lib", ".")
    end

    app_name = "Ladybird.app"
    app_path = "./Build/ladybird/bin/#{app_name}"

    prefix.install app_path
    bin.install_symlink "#{prefix}/#{app_name}/Contents/MacOS/Ladybird" => "ladybird"
  end

  def caveats
    <<~EOS
      Ladybird is in pre-alpha stage and is intended for developers only.
    EOS
  end
end
