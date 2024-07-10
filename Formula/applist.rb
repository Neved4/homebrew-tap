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

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/applist-0.1.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "08347646c55d0164c0b85f825c17767825b0c34535ced43a7ba870f6a74b1f04"
    sha256 cellar: :any_skip_relocation, ventura:      "3e1728fac1160792d98fa884158dc55b865a716938794d2b164d1bddb608f455"
    sha256 cellar: :any_skip_relocation, monterey:     "d78eb9cecd20b916dbaafaf90e4e2abb92c0c8558275de1543d3328163056240"
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
