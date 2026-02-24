class Iozone < Formula
  desc "File system benchmark tool"
  homepage "https://www.iozone.org/"
  url "https://www.iozone.org/src/current/iozone3_508.tar"
  sha256 "ee55af310a65ec97e1db214aebd75ee87f458b529cea3da37081a63974e8ace3"
  license :cannot_represent

  livecheck do
    url "https://www.iozone.org/src/current/"
    regex(/href=.*?iozone[._-]?v?(\d+(?:[._]\d+)+)\.t/i)
    strategy :page_match do |page, regex|
      page.scan(regex).map { |match| match&.first&.tr("_", ".") }
    end
  end

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/iozone-3.508"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "e853d2e7d079a33cac9a71f0c80ae8e6957a3046c01a3bac7308344d30234aae"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "baf8f4f8e266f36fd9d13d90e2edbd3ceb7c0c6970a6fa7548de956a4f0f8078"
  end

  patch :DATA

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

__END__
diff --git a/src/current/libasync.c b/src/current/libasync.c
--- a/src/current/libasync.c
+++ b/src/current/libasync.c
@@ -372,6 +372,9 @@
 * then the code will wait for the manditory first read.
 *************************************************************************/
 
+struct cache_ent *incache(struct cache *gc, long long fd, off64_t offset,
+  long long size);
+
 #ifdef HAVE_ANSIC_C
 int async_read(struct cache *gc, long long fd, char *ubuffer, off64_t offset,
 	long long size, long long stride, off64_t max, long long depth)
diff --git a/src/current/iozone.c b/src/current/iozone.c
--- a/src/current/iozone.c
+++ b/src/current/iozone.c
@@ -1332,9 +1332,10 @@
 #else
 long long *gc=0;
-void async_init(long long **,int,int);
+void async_init();
 int async_read();
 int async_read_no_copy();
 size_t async_write();
 size_t async_write_no_copy();
+void end_async();
 void async_release();
 #endif
@@ -20153,6 +20154,12 @@
 	printf("Your system does not support async I/O\n");
 	exit(172);
 }
+void
+end_async()
+{
+	printf("Your system does not support async I/O\n");
+	exit(173);
+}
 void
 async_release()
 {
