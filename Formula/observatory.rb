class Observatory < Formula
  desc "Mozilla HTTP Observatory CLI"
  homepage "https://github.com/mozilla/observatory-cli"
  url "https://registry.npmjs.org/observatory-cli/-/observatory-cli-0.7.1.tgz"
  sha256 "219a8eed782ecf40a580fc9ee6485a34b443c4461d6bf2ee516757cbfdc0eb39"
  license "MPL-2.0"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/observatory-0.7.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "81dae12d6a14680bc975fcf2c2dc54a92083c254485b3972ce309f0ad37d3f91"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e60cfbbee6292ceefc37c0be336329642ffe2f2ed86fabce9052e8e33bf1dc9c"
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/observatory --version")
  end
end
