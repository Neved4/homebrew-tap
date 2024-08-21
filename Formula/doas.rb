class Doas < Formula
  desc "Execute commands as another user"
  homepage "https://github.com/slicer69/doas"
  url "https://github.com/slicer69/doas/releases/tag/6.3p12"
  sha256 "f75577d7280a5596457aac9bb0c672cb9e75d0cb2222950dc703622335330f5a"
  license "BSD-2-Clause"
  head "https://github.com/slicer69/doas.git", branch: "master"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on "byacc" => :build

  def install
    system "ln", "-s", "/opt/homebrew/bin/byacc", "/opt/homebrew/bin/yacc"
    system "export", "PATH=/opt/homebrew/bin/yacc:$PATH"
    system "make", "all"
    system "make", "install"
  end

  def post_install
    system "make", "clean"
    system "rm", "/opt/homebrew/bin/yacc"
  end
end
