class Applist < Formula
  desc "List app directories under macOS!"
  homepage "https://github.com/Neved4/applist"
  url "https://github.com/Neved4/appdir/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "d247e41491a1552b73e4991e954772bea8002c51cc637e4b748153461589df62"
  license "MIT"
  head "https://github.com/Neved4/applist.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :macos

  def install
    bin.install "applist.sh" => "applist"
    doc.install "README.md"
  end

  test do
    desired_output = "/System/Library/CoreServices/Finder.app"
    assert_includes shell_output("#{bin}/applist").strip, desired_output
  end
end
