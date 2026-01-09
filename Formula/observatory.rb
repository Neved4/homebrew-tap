class Observatory < Formula
  desc "Mozilla HTTP Observatory CLI"
  homepage "https://github.com/mozilla/observatory-cli"
  url "https://registry.npmjs.org/observatory-cli/-/observatory-cli-0.7.1.tgz"
  sha256 "219a8eed782ecf40a580fc9ee6485a34b443c4461d6bf2ee516757cbfdc0eb39"
  license "MPL-2.0"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/observatory --version")
  end
end
