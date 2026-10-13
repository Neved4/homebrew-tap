class Tailsocks < Formula
  desc "Route traffic through Tailscale exit nodes using a local SOCKS5 proxy"
  homepage "https://github.com/ItalyPaleAle/tailsocks"
  url "https://github.com/ItalyPaleAle/tailsocks/archive/refs/tags/v1.6.3.tar.gz"
  sha256 "56ed70ff5e18952c58a3de79d8bf2bf23a1a18ef98339f4f125800c2683f1aec"
  license "MIT"
  head "https://github.com/ItalyPaleAle/tailsocks.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/tailsocks-1.6.3"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "78eab6dfd95d5bee17a676037b873e3b59e2e49042aaaf22e7a8ad10a2bbe64e"
    sha256 cellar: :any,                 x86_64_linux: "317cacb727e519acbfd725c5886ad5db82006cd18d92f8a36171b10c7bd64d28"
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
