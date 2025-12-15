class Penelope < Formula
  desc "Powerful shell handler built as a modern netcat replacement"
  homepage "https://github.com/brightio/penelope"
  url "https://github.com/brightio/penelope/archive/refs/tags/v0.14.14.tar.gz"
  sha256 "2b3f4e9e4c534f630deb730bb274b3e594f7ebf45c6082d1053fa62088fdaf88"
  license "GPL-3.0-or-later"
  head "https://github.com/brightio/penelope.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/penelope-0.14.14"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "c8ab7ba8328ff210b1cc3641dfb290a3946a2e7eb1af2dc2ddebc17504a7f512"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "df710bde42b3526dc3b57608c49466ef8e1f61cba643615c0e37f91f6bb76a3a"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "1fe4fa285d384b97df124716f0126b60d3386106a8c1d21c7fd650c96a289c6d"
  end

  depends_on "python@3.14"

  def install
    bin.install "penelope.py" => "penelope"
    pkgshare.install "extras"
  end

  test do
    # Fails in Linux CI with "Inappropriate ioctl for device"
    return if OS.linux? && ENV["HOMEBREW_GITHUB_ACTIONS"]

    assert_match version.to_s, shell_output("#{bin}/penelope -v 2>&1").strip

    # Eventually add in a better test, this one doesn't work for some reason
    # require "pty"
    # ENV["TERM"] = "xterm"
    # PTY.spawn(bin/"penelope") do |r, w, pid|
    #   # sleep 3
    #   # assert_match "Netcat + named pipe", r.read
    #   sleep 1
    #   w.write "\cC"
    # ensure
    #   # Process.kill("TERM", pid)
    #   Process.wait(pid)
    # end
  end
end
