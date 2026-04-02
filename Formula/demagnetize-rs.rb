class DemagnetizeRs < Formula
  desc "Convert magnet links to .torrent files"
  homepage "https://github.com/jwodder/demagnetize-rs"
  url "https://github.com/jwodder/demagnetize-rs/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "d03dae0040ea4bed241004a037194becd6ab521b7a85596859fa3ed385d85d85"
  license "MIT"
  head "https://github.com/jwodder/demagnetize-rs.git", branch: "master"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/demagnetize-rs-0.7.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "36111ea0c8c54eeb08f48b812161f9bf434c36b9ec1e2815e4fdbac035c05dcc"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ce27f611c56877a2d04a9bae144fb42f0cb7d196f4c4f79196b36042692de7c3"
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
