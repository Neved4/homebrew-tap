class Tailsocks < Formula
  desc "Route traffic through Tailscale exit nodes using a local SOCKS5 proxy"
  homepage "https://github.com/ItalyPaleAle/tailsocks"
  url "https://github.com/ItalyPaleAle/tailsocks/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "bd1bcee98cd3e0033ab97213dce594933d3333167b7ebed26ac05f343cda31fe"
  license "MIT"
  head "https://github.com/ItalyPaleAle/tailsocks.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/tailsocks-1.2.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "97e2ec27bfeab4635362094f03a826012d5d4a5bf0953cde1baef1b6869c391e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6f6fd6b0d5c87304335b7644175cd3f3685611cc43805494e295ed4c57e58152"
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
