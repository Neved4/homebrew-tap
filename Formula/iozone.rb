class Iozone < Formula
  desc "File system benchmark tool"
  homepage "https://www.iozone.org/"
  url "https://www.iozone.org/src/current/iozone3_510.tar"
  sha256 "9284601c4665a1bb171307e8b9e1d62360d6598e4b0e7a5641320966d9a6a5f7"
  license :cannot_represent

  livecheck do
    skip "Upstream lists 3.511, but its source archive returns HTTP 404"
  end

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/iozone-3.510"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "1c12e86938f398cffc0733d5777635284520438b58075e8eb66d643817a683fd"
  end

  def install
    ENV.append_to_cflags "-Wno-implicit-function-declaration"

    cd "src/current" do
      target = OS.mac? ? "macosx" : OS.kernel_name.downcase
      system "make", "clean"
      system "make", target, "CC=#{ENV.cc}"
      bin.install "iozone"
      pkgshare.install %w[
        Generate_Graphs
        client_list
        gengnuplot.sh
        gnu3d.dem
        gnuplot.dem
        gnuplotps.dem
        iozone_visualizer.pl
        report.pl
      ]
    end
    man1.install "docs/iozone.1"
  end

  test do
    assert_match "File size set to 16384 kB",
      shell_output("#{bin}/iozone -I -s 16M")
  end
end
