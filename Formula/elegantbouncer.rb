class Elegantbouncer < Formula
  desc "Detection tool for file-based exploits"
  homepage "https://github.com/msuiche/elegant-bouncer"
  url "https://github.com/msuiche/elegant-bouncer/archive/3016295e58d0539e79fb1f2bd9faa77be8489f3d.tar.gz"
  version "0.2,3016295e58d0539e79fb1f2bd9faa77be8489f3d"
  sha256 "d80b0c81c16a0b230e6c2eed8dcdd93deaff607a5187189a1c4566bebd13085f"
  license "CC-BY-NC-SA-4.0"
  head "https://github.com/msuiche/elegant-bouncer.git", branch: "main"

  livecheck do
    skip "No tagged version available"
  end

  depends_on "rust" => :build
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    desired_output_version = "elegantbouncer #{version.to_s.split(",").first}"
    assert_equal desired_output_version, shell_output("#{bin}/elegantbouncer --version").strip

    desired_output_sha3 = "58ef9dc603da1b6e3829a160c5a9b0c3f4ef3622e1787a80ab2b59a784348d35"
    test_file = test_fixtures("test.svg")
    assert_includes shell_output("#{bin}/elegantbouncer --scan #{test_file}").strip, desired_output_sha3
  end
end
