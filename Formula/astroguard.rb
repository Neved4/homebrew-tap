class Astroguard < Formula
  desc "Code auditing and profiling tool for C programs"
  homepage "https://github.com/ANG13T/astroguard"
  url "https://github.com/ANG13T/astroguard/archive/9ca1197217aa66d618d7326816a8c7e4d851c6d2.tar.gz"
  version "0.1-20240122-9ca1197"
  sha256 "3d2f2536a73560cfb9592517590bb0b0edeba833d10e863172fe110de04aa0d0"
  license "MIT"

  livecheck do
    skip "No tagged version available"
  end

  depends_on "gcc"

  def install
    bin.install "astroguard.sh" => "astroguard"
  end

  test do
    assert_path_exists bin/"astroguard"
  end
end
