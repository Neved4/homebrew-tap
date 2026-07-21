class Dgen < Formula
  desc "Sega Genesis / Mega Drive emulator"
  homepage "https://dgen.sourceforge.net"
  url "https://git.code.sf.net/p/dgen/dgen.git",
      tag:      "v1.33",
      revision: "1c196e63d3e35704a97a2cef60def9df3c9fd1ce"

  head "https://git.code.sf.net/p/dgen/dgen.git", branch: "master"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/dgen-1.33"
    rebuild 1
    sha256 cellar: :any, x86_64_linux: "3ec4e3ac20894717b141680d6bce7c0265ed9e92eab152786d78189c1c94f548"
  end

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libarchive"
  depends_on "sdl12-compat"

  def install
    # Clang 7 and newer interpret adjacent string literals without whitespace as user-defined literals.
    inreplace "main.cpp", '"DGen/SDL v"VER', '"DGen/SDL v" VER'
    inreplace "main.cpp", '"DGen/SDL version "VER', '"DGen/SDL version " VER'

    args = %W[
      --disable-silent-rules
      --disable-dependency-tracking
      --disable-sdltest
      --prefix=#{prefix}
    ]
    args << "--disable-asm" if Hardware::CPU.arm?
    system "./autogen.sh"
    system "./configure", *args
    system "make", "install"
  end

  def caveats
    <<~EOS
      If some keyboard inputs do not work, try modifying configuration:
        ~/.dgen/dgenrc
    EOS
  end

  test do
    assert_equal "DGen/SDL version #{version}", shell_output("#{bin}/dgen -v").chomp
  end
end
