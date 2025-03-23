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

  def install
    system ENV.cc, "-O3", "center.c", "-o", "center"
    bin.install "center"
  end
end
