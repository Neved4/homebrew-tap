class Inferno < Formula
  desc "Performance analysis and flamegraph utilities"
  homepage "https://github.com/jonhoo/inferno"
  url "https://github.com/jonhoo/inferno/archive/refs/tags/v0.12.6.tar.gz"
  sha256 "4b0e22ae5e701f6de8fdfbf13ddac501b421f4db6e527c296222fd885e68bcd5"
  license "CDDL-1.0"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/inferno-0.12.5"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "6142f67c51d98dd3fff17c4e7a827bd0bf7b5415af998445b3fdcfdf28c851ce"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7260eb7a5fb3ae5d18b2966936a87cfaf0d781aaee29114af5cfaa81f8325ea5"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "inferno", shell_output("#{bin}/inferno-flamegraph --help")
  end
end
