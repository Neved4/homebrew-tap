class Tailsocks < Formula
  desc "Route traffic through Tailscale exit nodes using a local SOCKS5 proxy"
  homepage "https://github.com/ItalyPaleAle/tailsocks"
  url "https://github.com/ItalyPaleAle/tailsocks/archive/refs/tags/v1.2.4.tar.gz"
  sha256 "79cff1f85e2463f6db83f431a01de81319a7807c86db799bf085edf9b47d8b1f"
  license "MIT"
  head "https://github.com/ItalyPaleAle/tailsocks.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/tailsocks-1.2.4"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "3851b251c8569397e4be3a669e422092d65e93d857aa549df07e84541e5cc56e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9db7f56d41b699714e71aaad72899f1d19cf1b779cd428aeb8868a65e50cbed1"
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
