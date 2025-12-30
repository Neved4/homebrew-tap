class Penelope < Formula
  desc "Powerful shell handler built as a modern netcat replacement"
  homepage "https://github.com/brightio/penelope"
  url "https://github.com/brightio/penelope/archive/refs/tags/v0.15.0.tar.gz"
  sha256 "5209431b60b94cb00094a3966f6c298310e01ddd5c755113390c825e623f2b31"
  license "GPL-3.0-or-later"
  head "https://github.com/brightio/penelope.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/penelope-0.15.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "0ab0768be4d8df399fa7555377dd58bdd995b93711fdc6a20536f9290fe48d25"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "2877b1fb3ba2ea8b599bcdc6eb24aa656d661dbc7e8991c849e0d835014cf449"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "e7fb86e43deae6067aa4aaf6d5c74ba10e6f057fd325b5e8aecbed71e9e57b33"
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
