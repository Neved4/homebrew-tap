class Iozone < Formula
  desc "File system benchmark tool"
  homepage "https://www.iozone.org"
  url "https://www.iozone.org/src/current/iozone3_507.tgz"
  sha256 "dd03eccd3768e8400816d67ae0e47f4646cb5834cfc2fc09927fe7b87a6fca7a"
  license :cannot_represent

  livecheck do
    url "https://www.iozone.org/src/current/"
    regex(/href=.*?iozone[._-]?v?(\d+(?:[._]\d+)+)\.t/i)
    strategy :page_match do |page, regex|
      page.scan(regex).map { |match| match&.first&.tr("_", ".") }
    end
  end

  depends_on "gcc@13" => :build

  def install
    cd "src/current" do
      target = OS.mac? ? "macosx" : OS.kernel_name.downcase
      system "make", "clean"
      system "make", target, "CC=#{ENV.cc}", "CFLAGS=#{ENV.cflags}"
      bin.install "iozone"
      pkgshare.install %w[Generate_Graphs client_list gengnuplot.sh gnu3d.dem
                          gnuplot.dem gnuplotps.dem iozone_visualizer.pl
                          report.pl]
    end
    man1.install "docs/iozone.1"
  end

  test do
    assert_match "File size set to 16384 kB",
      shell_output("#{bin}/iozone -I -s 16M")
  end
end
