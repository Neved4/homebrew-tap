class DemagnetizeRs < Formula
  desc "Convert magnet links to .torrent files"
  homepage "https://github.com/jwodder/demagnetize-rs"
  url "https://github.com/jwodder/demagnetize-rs/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "1b5324046151b9836a71e37c63967f3793df0032e88fb95963b0266469a42b5f"
  license "MIT"
  head "https://github.com/jwodder/demagnetize-rs.git", branch: "master"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/demagnetize-rs-0.6.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "0e66f0c097790bb6a8e5d33805b22952f1283b787c5d89137f6b54b3ef67b139"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "72140af44498b8df67edfbb7c44b2c5f90d465979a25c7960ca9241035ec6493"
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
