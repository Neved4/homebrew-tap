class Tailsocks < Formula
  desc "Route traffic through Tailscale exit nodes using a local SOCKS5 proxy"
  homepage "https://github.com/ItalyPaleAle/tailsocks"
  url "https://github.com/ItalyPaleAle/tailsocks/archive/refs/tags/v1.6.1.tar.gz"
  sha256 "0fda4e07381d40d27fcae7041705a8c8b0d15b6531f503938d831373bbe30a3c"
  license "MIT"
  head "https://github.com/ItalyPaleAle/tailsocks.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/tailsocks-1.6.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "49a1d7cf4d7043bdf62fbff0fd8a55ec6fd14bb8aa94aaf60cf8f48165b2ce4f"
    sha256 cellar: :any,                 x86_64_linux: "58016a5fa7797f9e803cdc9aec3f62a16ff6df634c50a476786f51f6a62430fc"
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
