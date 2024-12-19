class DemagnetizeRs < Formula
  desc "Convert magnet links to .torrent files"
  homepage "https://github.com/jwodder/demagnetize-rs"
  url "https://github.com/jwodder/demagnetize-rs/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "228a00a7d8567da9467c0352c6736934c0d42e9b52b40d1f44bcfff842e5373d"
  license "MIT"
  head "https://github.com/jwodder/demagnetize-rs.git", branch: "master"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/demagnetize-rs-0.2.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1a11b7423659d721e941d43f1efac5b512de1eeeb7432beec49ccfe3241f02fe"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "0ae03b5363135214b6e3ea1b6fd035cdfc2127048ccc5ce4c2b0a1b707489776"
    sha256 cellar: :any_skip_relocation, ventura:       "b658aa9b53ecd432a66c25e93887412f5bea773b0a852e056aaa74b3b3fc60ee"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "7cfd6bd62e5f06650d7cf1b7cec9ca1d80663a5c5a6b9d36eb476f7d5e00fb6b"
  end

  depends_on "rust" => :build
  depends_on "openssl@3"

  def install
    system "cargo", "install", *std_cargo_args
    bin.install "#{bin}/demagnetize" => "demagnetize-rs"
  end

  test do
    desired_output_version = "demagnetize #{version}"
    assert_equal desired_output_version, shell_output("#{bin}/demagnetize-rs --version").strip

    desired_output = "no trackers given in magnet URI"
    command = 'demagnetize-rs get "magnet:?xt=urn:btih:265863cbbb5ed9ef39e7c891ebebdf1623b09d5e&dn=' \
              'archlinux-2024.12.01-x86_64.iso" 2>&1'
    assert_includes shell_output(command, 2).strip, desired_output
  end
end
