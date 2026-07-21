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
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "a76c6bdeeba4f238225a07376fbb156b12077aff030ac7c94b69e42eeb3566ae"
    sha256 cellar: :any,                 x86_64_linux: "1dd7073c1d38a7a93a4456c9e046f799cabd8322c87ae0a6117b9a3e1f27578e"
  end

  resource "testfile" do
    url "https://s3.amazonaws.com/ARJ/ARJ286.EXE"
    sha256 "e7823fe46fd971fe57e34eef3105fa365ded1cc4cc8295ca3240500f95841c1f"

    livecheck do
      skip "Fixed test fixture"
    end
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
      assert_path_exists Pathname.pwd/"arj.exe"
    end
  end
end
