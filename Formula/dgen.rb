class Dgen < Formula
  desc "Sega Genesis / Mega Drive emulator"
  homepage "https://dgen.sourceforge.net"
  url "https://git.code.sf.net/p/dgen/dgen.git",
      tag:      "v1.33",
      revision: "1c196e63d3e35704a97a2cef60def9df3c9fd1ce"

  head "https://git.code.sf.net/p/dgen/dgen.git", branch: "master"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/dgen-1.33"
    sha256 cellar: :any,                 arm64_sequoia: "b5bcaea02db2a0e6c7d1ab10c3766aea6111414666fdcdf3f64a1fe8b655a137"
    sha256 cellar: :any,                 arm64_sonoma:  "3c42b0826677c00fa0902a720b3eebea4d0e335f81edde4c7cf489849dc07259"
    sha256 cellar: :any,                 ventura:       "db54c0245c266031c8986760cbaeea387deac1b4c379266635e303ace24c3430"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "681f2fd2b8eb3deceac795a7e11d535df6fe7cb424cbeec4cc50779dd075d5ab"
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
