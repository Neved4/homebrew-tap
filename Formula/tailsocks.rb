class Tailsocks < Formula
  desc "Route traffic through Tailscale exit nodes using a local SOCKS5 proxy"
  homepage "https://github.com/ItalyPaleAle/tailsocks"
  url "https://github.com/ItalyPaleAle/tailsocks/archive/refs/tags/v1.5.1.tar.gz"
  sha256 "2c0440a5b1b0b43d46f6cec4aeef5ac05c41e5b1a587d32f1c395d0d02832c67"
  license "MIT"
  head "https://github.com/ItalyPaleAle/tailsocks.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/tailsocks-1.5.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "fe71bfb32738bf5269e83b4fcdae03d5c72d2c3baaf3441c483e4ee06b95542a"
    sha256 cellar: :any,                 x86_64_linux: "a466028a4c3d3def43d0e4fd77d88690c0b53dc3957ec3d0e2f2373b758b26ae"
  end

  depends_on "go" => :build

  def install
    build_pkg = "github.com/italypaleale/tailsocks/buildinfo"
    ldflags = %W[
      -s -w
      -X #{build_pkg}.Production=1
      -X #{build_pkg}.AppVersion=#{version}
      -X #{build_pkg}.BuildId=#{version}
      -X #{build_pkg}.BuildDate=#{Time.now.utc.iso8601}
      -X #{build_pkg}.CommitHash="Unknown"
    ]
    system "go", "build", *std_go_args(output: bin/"tailsocks", ldflags: ldflags.join(" "))
  end

  test do
    output = shell_output("#{bin}/tailsocks --version").chomp
    assert_includes output, "tailsocks #{version}"
  end
end
