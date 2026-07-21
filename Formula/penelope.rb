class Penelope < Formula
  desc "Powerful shell handler built as a modern netcat replacement"
  homepage "https://github.com/brightio/penelope"
  url "https://github.com/brightio/penelope/archive/refs/tags/v0.21.0.tar.gz"
  sha256 "6356f2504fe28ae6f7a93ac2377e0734b0eb5f019b23a0a6360d42ef4308a7e1"
  license "GPL-3.0-or-later"
  head "https://github.com/brightio/penelope.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/penelope-0.20.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "9e5e080b5ccdbc7ae88ffc4cf6050d53659956215a0cb89353591698c031acb9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0145caddaa0180385f603eb617be4fd5175e1a7498e0b766a65cf6a9dd91c9ad"
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
