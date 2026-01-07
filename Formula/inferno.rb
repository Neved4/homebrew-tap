class Inferno < Formula
  desc "Performance analysis and flamegraph utilities"
  homepage "https://github.com/jonhoo/inferno"
  url "https://github.com/jonhoo/inferno/archive/refs/tags/v0.12.4.tar.gz"
  sha256 "af1d4520c9a3ecc25601f0e6f049d6acb484b9736d00f218a5a9859f4a597770"
  license "CDDL-1.0"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/inferno-0.9.9"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "b3765978a71babd6486017500c254b422c88f4714d84c964b7f552ff3b98d958"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "7e50c7a7c5343e453db46bd06fe6cb792b331a5e3bbc8ef338819aca039f0720"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "3958a9216b9470348a4daf52dc4181744a8063daf1b29908e80fe7b16a08ab0c"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "inferno", shell_output("#{bin}/inferno-flamegraph --help")
  end
end
