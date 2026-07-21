class Inferno < Formula
  desc "Performance analysis and flamegraph utilities"
  homepage "https://github.com/jonhoo/inferno"
  url "https://github.com/jonhoo/inferno/archive/refs/tags/v0.12.8.tar.gz"
  sha256 "b55a0ff810928fdf52d5d101ffb0b76b49b7fbf6bfc1d061361bc76d170a0976"
  license "CDDL-1.0"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/inferno-0.12.8"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "1ff7c0b738d62d7c600cfadc43236406337db6d0e07e78a9f3092cd8074d208e"
    sha256 cellar: :any,                 x86_64_linux: "82b7c85e0581ea62c6491ae50a42ae352830a1c50e7c6f6053cf345d511bf7a2"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "inferno", shell_output("#{bin}/inferno-flamegraph --help")
  end
end
