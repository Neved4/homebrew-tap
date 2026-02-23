class Tailsocks < Formula
  desc "Route traffic through Tailscale exit nodes using a local SOCKS5 proxy"
  homepage "https://github.com/ItalyPaleAle/tailsocks"
  url "https://github.com/ItalyPaleAle/tailsocks/archive/refs/tags/v1.2.2.tar.gz"
  sha256 "102fa0f5460dd657fa2ace2df6bbfbef427de5f0d628622e2b4af388a6332f0b"
  license "MIT"
  head "https://github.com/ItalyPaleAle/tailsocks.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/tailsocks-1.2.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "e123a730ad726ba6f6cd9c97863f6bdc35c4c278c452571743ff0bdd00f6e431"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "919e570749febcd0a08856b2a16d3cbb8468d91ccad29a15fa3419b19ff9590b"
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
