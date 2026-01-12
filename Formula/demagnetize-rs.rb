class DemagnetizeRs < Formula
  desc "Convert magnet links to .torrent files"
  homepage "https://github.com/jwodder/demagnetize-rs"
  url "https://github.com/jwodder/demagnetize-rs/archive/refs/tags/v0.6.1.tar.gz"
  sha256 "6bc1f566cfbaa9bff3853748c6c28df5eebf719119f1aef79a6fca4ac21189e4"
  license "MIT"
  head "https://github.com/jwodder/demagnetize-rs.git", branch: "master"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/demagnetize-rs-0.6.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "192d2ab48f16faade15531c3b9596be538eb4ba460ee214637692023b09bf214"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f537fac4225373e3da32bbf3eb5d17a398601bd360203df280b5a832c3fc52bd"
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

    desired_output = "Convert magnet links to .torrent files"
    assert_includes shell_output("#{bin}/demagnetize-rs --help").strip, desired_output
  end
end
