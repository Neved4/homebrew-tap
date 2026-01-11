class DemagnetizeRs < Formula
  desc "Convert magnet links to .torrent files"
  homepage "https://github.com/jwodder/demagnetize-rs"
  url "https://github.com/jwodder/demagnetize-rs/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "1b5324046151b9836a71e37c63967f3793df0032e88fb95963b0266469a42b5f"
  license "MIT"
  head "https://github.com/jwodder/demagnetize-rs.git", branch: "master"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/demagnetize-rs-0.5.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1cf16939bf65b31b7be6b3a03830949368aa6efe48951e76e6fab791a28e4169"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "1119183e2e1e30a5ef89c0517cdbe6f4582707f7c25a8b6cc4acbfd9186c84e1"
    sha256 cellar: :any_skip_relocation, ventura:       "edd8635e3864bc93a3f109c80c5af43c2694216c86f9f863b03e07834a2adda4"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "6ca87dcbf71551e89fba3913585a907e11c765a47892e982630196d1d50b98c4"
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
