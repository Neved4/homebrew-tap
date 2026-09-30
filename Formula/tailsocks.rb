class Tailsocks < Formula
  desc "Route traffic through Tailscale exit nodes using a local SOCKS5 proxy"
  homepage "https://github.com/ItalyPaleAle/tailsocks"
  url "https://github.com/ItalyPaleAle/tailsocks/archive/refs/tags/v1.6.2.tar.gz"
  sha256 "544ef59a733cf5f42297aca1a2f90774c9edb1f4f1af0a1bc00542ae25944994"
  license "MIT"
  head "https://github.com/ItalyPaleAle/tailsocks.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/tailsocks-1.6.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "ceb6991fe7bb569a8f0b1cce3bb0746425bcaeb16b6b6a6bbdb88bfb4686e2ff"
    sha256 cellar: :any,                 x86_64_linux: "c290e2bce51dcf18b80c7458713f49e58719e88ca617fccfb3995a47670c6324"
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
