class Center < Formula
  desc "Centers text from stdin"
  homepage "https://github.com/LizzyFleckenstein03/center"
  url "https://github.com/LizzyFleckenstein03/center/archive/refs/heads/master.tar.gz"
  version "0.1.0-239545081facf055a4928ee5fb947150ebbd5e65"
  sha256 "4cd21b441679659d8ebab357dd3a26fc5b991a2c9f02786098123c007b35bd09"
  license "GPL-3.0-or-later"
  head "https://github.com/LizzyFleckenstein03/center.git", branch: "master"

  livecheck do
    skip "No tagged version available"
  end

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/center-0.1.0-239545081facf055a4928ee5fb947150ebbd5e65"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "15898522d8b532d34d6ae57f6abe13c5d471a4cb644341967c0313d009a16d6d"
    sha256 cellar: :any,                 x86_64_linux: "c7043f56e4959cb73989e0ac05081b7479f58648515141d853b4f38eec234f74"
  end

  def install
    system ENV.cc, "-O3", "center.c", "-o", "center"
    bin.install "center"
  end

  test do
    command = if OS.mac?
      "script -q /dev/null #{bin}/center"
    else
      "script -q -c #{bin}/center /dev/null"
    end
    output = pipe_output(command, "Homebrew\n")
    assert_match "Homebrew", output
  end
end
