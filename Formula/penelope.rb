class Penelope < Formula
  desc "Powerful shell handler built as a modern netcat replacement"
  homepage "https://github.com/brightio/penelope"
  url "https://github.com/brightio/penelope/archive/refs/tags/v0.21.0.tar.gz"
  sha256 "6356f2504fe28ae6f7a93ac2377e0734b0eb5f019b23a0a6360d42ef4308a7e1"
  license "GPL-3.0-or-later"
  head "https://github.com/brightio/penelope.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/penelope-0.21.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "795a5714825424b4a57c92f140bf499dd05631506e0daa333eae1fcd6452e0a1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "939267f3c672d10c0a9d75abd4124bba4038f0d39480ea50064f635c1852c861"
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
