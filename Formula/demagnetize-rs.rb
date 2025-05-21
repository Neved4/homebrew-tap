class DemagnetizeRs < Formula
  desc "Convert magnet links to .torrent files"
  homepage "https://github.com/jwodder/demagnetize-rs"
  url "https://github.com/jwodder/demagnetize-rs/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "dd9d3e9f4a086c2d35dc5f7b81e8a5a8167fb6f22a21bedea31038a52cc9b63c"
  license "MIT"
  head "https://github.com/jwodder/demagnetize-rs.git", branch: "master"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/demagnetize-rs-0.4.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "04a27df0b85be25059e61010dbbb6bf554108e0250795e0f5ec8e648bf5a5e3a"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "9da2fd3a4602aa21becb913557f9d26eb88f01336b6ed28f5aaa5757510ba33d"
    sha256 cellar: :any_skip_relocation, ventura:       "e2c91e00d46457cca8602fa6b2f176fb2b8bca2aa30a72f6ac0719d1442e3237"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "ca50b5ef58c615cdec51b4937a16659594e288779cf2b2ef7468ec414c129ccc"
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
