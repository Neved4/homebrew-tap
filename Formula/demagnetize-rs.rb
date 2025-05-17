class DemagnetizeRs < Formula
  desc "Convert magnet links to .torrent files"
  homepage "https://github.com/jwodder/demagnetize-rs"
  url "https://github.com/jwodder/demagnetize-rs/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "922bdbadff4cc898ca942d4dcd066abc3af8712c3dd077698e1802c18f7c6cee"
  license "MIT"
  head "https://github.com/jwodder/demagnetize-rs.git", branch: "master"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/demagnetize-rs-0.3.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "6d33aae2d1d82d72daec9db5f63a63261f68363198cf82e0ea508e0455f0a4da"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "4732aa3ad72d4a93b5997f97d12d0109615980d51b2f99fd006988d451dd58f0"
    sha256 cellar: :any_skip_relocation, ventura:       "a2251862a08574dc86489e5548aa991415ca508497d5f4e1db1bf3347686bf37"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "c86a2139082d7540dfb93b9b33fe3eb9909885bccba202fd2b5eec1f30de6c18"
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
