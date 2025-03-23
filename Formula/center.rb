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
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "61ce46e776320769221b1df086312cda9efd69e5e5385a5e3cbba08192e23d64"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "2fb760d99e8fc3ee206940e892f20fa16f3e804b739fedd2e3dff8a67789971e"
    sha256 cellar: :any_skip_relocation, ventura:       "3e423bfc52be2face3752c330e59b6e336d702b5d28753b5a1fdb2b326881aa1"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "77ae709ddf12f031d6d0ee7fc26ba3d5bd14e8f62cb5fa7f4a4324c95ea6168b"
  end

  def install
    system ENV.cc, "-O3", "center.c", "-o", "center"
    bin.install "center"
  end
end
