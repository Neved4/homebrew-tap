class DemagnetizeRs < Formula
  desc "Convert magnet links to .torrent files"
  homepage "https://github.com/jwodder/demagnetize-rs"
  url "https://github.com/jwodder/demagnetize-rs/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "9714bdb88637106f723062ca203023178078501223b16e46823c90b80fa8dbf4"
  license "MIT"
  head "https://github.com/jwodder/demagnetize-rs.git", branch: "master"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/demagnetize-rs-0.3.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "3517b0fd0517a62600a63b05c679e51c90b54d3bbba98543fbf2420f383fba1a"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "1a7da88bb135ae5c2676ee721a73f1fadcd9aadb73235f25a464d2f95037eece"
    sha256 cellar: :any_skip_relocation, ventura:       "9748e29c7e6f7e24cce504f6442e908dd54f36c9901463418db0d35b57571770"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "3522dcaec5f233a88f6dd0747287bb2be55fb1a63796649cb647cf5c3a88152a"
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
