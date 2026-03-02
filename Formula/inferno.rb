class Inferno < Formula
  desc "Performance analysis and flamegraph utilities"
  homepage "https://github.com/jonhoo/inferno"
  url "https://github.com/jonhoo/inferno/archive/refs/tags/v0.12.6.tar.gz"
  sha256 "4b0e22ae5e701f6de8fdfbf13ddac501b421f4db6e527c296222fd885e68bcd5"
  license "CDDL-1.0"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/inferno-0.12.6"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "0c3c3dfa1fa5813f319dd9b4873a09ef9d2b88e8b0bfcba46a799a5ce5fa33e6"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5d60aeb07b3284e0393010ad0feca1b6e66af5731f398f049f4b51fd073e06fd"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "inferno", shell_output("#{bin}/inferno-flamegraph --help")
  end
end
