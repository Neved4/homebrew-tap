class WeechatLite < Formula
  desc "Extensible IRC client without spell checking"
  homepage "https://weechat.org/"
  url "https://weechat.org/files/src/weechat-4.10.1.tar.xz"
  sha256 "b8744c6f5dc5543062791f563e0516dbc96a36161e1a03c468b3b7dcc8be5aff"
  license "GPL-3.0-or-later"
  head "https://github.com/weechat/weechat.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/weechat-lite-4.10.1"
    sha256 arm64_tahoe:  "17277629d43812444668dfd5739197a178ee88bc17312e93018b87d4b98b0739"
    sha256 x86_64_linux: "7aac86f378e5b9a2e92d958513640afcda239b28bfed1c304b6f204e6366d229"
  end

  depends_on "asciidoctor" => :build
  depends_on "cmake" => :build
  depends_on "gettext" => :build # for xgettext
  depends_on "pkgconf" => :build
  depends_on "cjson"
  depends_on "gnutls"
  depends_on "libgcrypt"
  depends_on "lua"
  depends_on "ncurses"
  depends_on "python@3.14"
  depends_on "ruby"
  depends_on "tcl-tk"
  depends_on "zstd"

  uses_from_macos "curl"
  uses_from_macos "perl"

  on_macos do
    depends_on "gettext"
    depends_on "libgpg-error"
  end

  on_linux do
    depends_on "zlib-ng-compat"
  end

  def install
    tcltk = Formula["tcl-tk"]
    args = %W[
      -DENABLE_ENCHANT=OFF
      -DENABLE_SPELL=OFF
      -DPython_EXECUTABLE=#{formula_opt_bin("python@3.14")}/python3.14
      -DENABLE_GUILE=OFF
      -DENABLE_JAVASCRIPT=OFF
      -DENABLE_MAN=ON
      -DENABLE_PHP=OFF
      -DTCL_INCLUDE_PATH=#{tcltk.opt_include}/tcl-tk
      -DTCL_LIBRARY=#{tcltk.opt_lib/shared_library("libtcl#{tcltk.version.major_minor}")}
      -DTK_INCLUDE_PATH=#{tcltk.opt_include}/tcl-tk
      -DTK_LIBRARY=#{tcltk.opt_lib/shared_library("libtcl#{tcltk.version.major}tk#{tcltk.version.major_minor}")}
    ]

    # Help CMake find Perl header on macOS due to non-standard layout
    if OS.mac?
      perl = DevelopmentTools.locate("perl")
      perl_archlib = Utils.safe_popen_read(perl.to_s, "-MConfig", "-e", "print $Config{archlib}")
      args += %W[
        -DPERL_EXECUTABLE=#{perl}
        -DPERL_INCLUDE_PATH=#{MacOS.sdk_path}/#{perl_archlib}/CORE
      ]
    end

    system "cmake", "-S", ".", "-B", "build", *args, *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system bin/"weechat", "-r", "/quit"
  end
end
