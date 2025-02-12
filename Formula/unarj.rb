class Unarj < Formula
  desc "ARJ file archiver"
  homepage "http://www.arjsoftware.com/files.htm"
  url "https://src.fedoraproject.org/repo/pkgs/unarj/unarj-2.65.tar.gz/c6fe45db1741f97155c7def322aa74aa/unarj-2.65.tar.gz"
  sha256 "d7dcc325160af6eb2956f5cb53a002edb2d833e4bb17846669f92ba0ce3f0264"

  livecheck do
    url "https://src.fedoraproject.org/repo/pkgs/unarj/"
    regex(/href=.*?unarj[._-]v?(\d+(?:\.\d+)+[a-z]?)\.t/i)
  end

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/unarj-2.65"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "2322006fa53e1e6318c91c2f5b9f0266319405282e0dd9dd9b7d2d5e1419bfea"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "0ed47a012058845d2dee6e3ea9c4197f030aec7314d49abd68ffea006ed36c94"
    sha256 cellar: :any_skip_relocation, ventura:       "4b6bffaea32945e763707c417a41a01d4d728945c779b7e6338cb6a23a2577cf"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "451bacefa8a1caf04023bf2e095296357ddf80d0bf6a6df57580f119a95be18c"
  end

  resource "testfile" do
    url "https://s3.amazonaws.com/ARJ/ARJ286.EXE"
    sha256 "e7823fe46fd971fe57e34eef3105fa365ded1cc4cc8295ca3240500f95841c1f"
  end

  def install
    system "make"
    bin.mkdir
    system "make", "install", "INSTALLDIR=#{bin}"
  end

  test do
    # Ensure that you can extract arj.exe from a sample self-extracting file
    resource("testfile").stage do
      system bin/"unarj", "e", "ARJ286.EXE"
      assert_predicate Pathname.pwd/"arj.exe", :exist?
    end
  end
end
