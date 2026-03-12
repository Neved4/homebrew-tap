class Penelope < Formula
  desc "Powerful shell handler built as a modern netcat replacement"
  homepage "https://github.com/brightio/penelope"
  url "https://github.com/brightio/penelope/archive/refs/tags/v0.19.1.tar.gz"
  sha256 "f599f24232fee07f9a890fd078681f865a860a444a856f5c3271bfa3c979c53c"
  license "GPL-3.0-or-later"
  head "https://github.com/brightio/penelope.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/penelope-0.19.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "1488f3c880692279e56d6729894f28b81dea7a3588e15e476fca824cf0effa58"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4a863285d594864246a01d88af300212065b7bb5ce3e8faf8185b28e1af7a663"
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
