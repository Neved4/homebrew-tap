class Inferno < Formula
  desc "Performance analysis and flamegraph utilities"
  homepage "https://github.com/jonhoo/inferno"
  url "https://github.com/jonhoo/inferno/archive/refs/tags/v0.12.5.tar.gz"
  sha256 "a403156ce60e3cdfe5f4fc883777a59017ee5c13b777eeb55deaaeedd39945df"
  license "CDDL-1.0"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/inferno-0.12.4"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "f02a5f5c393ffeb5ebd55158bf34b86a38c8b90a1ba311a07976b8de11c9db4c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1df97367d2f4937563de12723944c79747463988a121ccb99a1e38678b31b04a"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "inferno", shell_output("#{bin}/inferno-flamegraph --help")
  end
end
