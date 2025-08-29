class Elegantbouncer < Formula
  desc "Detection tool for file-based exploits"
  homepage "https://github.com/msuiche/elegant-bouncer"
  url "https://github.com/msuiche/elegant-bouncer/archive/3016295e58d0539e79fb1f2bd9faa77be8489f3d.tar.gz"
  version "0.2_1-3016295e58d0539e79fb1f2bd9faa77be8489f3d"
  sha256 "d80b0c81c16a0b230e6c2eed8dcdd93deaff607a5187189a1c4566bebd13085f"
  license "CC-BY-NC-SA-4.0"
  version_scheme 1
  head "https://github.com/msuiche/elegant-bouncer.git", branch: "main"

  livecheck do
    skip "No tagged version available"
  end

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/elegantbouncer-0.2_1-3016295e58d0539e79fb1f2bd9faa77be8489f3d"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "2914c49b7dd81207c3770a5ad5c66f33497f80976f11bedef8da7cec2cb54b66"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "2a880b61e9747a28958b1e633fc7c894b7ef80e129dfdfd7368631d7086dd66f"
    sha256 cellar: :any_skip_relocation, ventura:       "200a6384c977b43cf048eb9a4bcd045cd710e5fd87fb9f0b605f6e96bcfdee87"
  end

  depends_on "rust" => :build
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    desired_output_version = "elegantbouncer #{version.to_s.split("_").first}"
    assert_equal desired_output_version, shell_output("#{bin}/elegantbouncer --version").strip

    desired_output_sha3 = "58ef9dc603da1b6e3829a160c5a9b0c3f4ef3622e1787a80ab2b59a784348d35"
    test_file = test_fixtures("test.svg")
    assert_includes shell_output("#{bin}/elegantbouncer --scan #{test_file}").strip, desired_output_sha3
  end
end
