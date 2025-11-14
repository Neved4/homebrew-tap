class Penelope < Formula
  desc "Powerful shell handler built as a modern netcat replacement"
  homepage "https://github.com/brightio/penelope"
  url "https://github.com/brightio/penelope/archive/refs/tags/v0.14.8.tar.gz"
  sha256 "db9f1e8ddbf2d29f25b1ab06cb4c6e055e48d45472b68726b64ca56b5e1486e1"
  license "GPL-3.0-or-later"
  head "https://github.com/brightio/penelope.git", branch: "main"

  depends_on "python@3.14"

  def install
    bin.install "penelope.py" => "penelope"
    pkgshare.install "extras"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/penelope -v 2>&1")

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
