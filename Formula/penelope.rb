class Penelope < Formula
  desc "Powerful shell handler built as a modern netcat replacement"
  homepage "https://github.com/brightio/penelope"
  url "https://github.com/brightio/penelope/archive/refs/tags/v0.14.8.tar.gz"
  sha256 "db9f1e8ddbf2d29f25b1ab06cb4c6e055e48d45472b68726b64ca56b5e1486e1"
  license "GPL-3.0-or-later"
  head "https://github.com/brightio/penelope.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/penelope-0.14.8"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "436c8d1a5ffce6144267e64a7ab9f2586f2f2e78acb99ce132874968c89366db"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b49944a8973ddcd87661cf91990334295d79b4c192baa38665f965d182cce15b"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "882d68f05cf0b98adbda893b58224040426fabfa184cf5ce59c9d4197a2b0267"
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
