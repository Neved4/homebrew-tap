class DemagnetizeRs < Formula
  desc "Convert magnet links to .torrent files"
  homepage "https://github.com/jwodder/demagnetize-rs"
  url "https://github.com/jwodder/demagnetize-rs/archive/refs/tags/v0.7.1.tar.gz"
  sha256 "08a749c642d80bf2da011136ce31f866392429b57c4a68cb13f3dc717134e644"
  license "MIT"
  head "https://github.com/jwodder/demagnetize-rs.git", branch: "master"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/demagnetize-rs-0.7.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "b754b317e1a99ba5cd5b5547721174f624cf30c6985c328da044bb9d88640fb3"
    sha256 cellar: :any,                 x86_64_linux: "2d723e191e20cdb54d7f80f0af001ac17c60af79f5979ff81385a9ef2951ccab"
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
