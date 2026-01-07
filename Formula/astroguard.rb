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

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/astroguard-0.1-20240122-9ca1197"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "dcbce15c81419126e466eb6963687460e941dc82490a361062928dd05d34b6c4"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d1bd03e364f2aa2bf28c3e29a1d939f1b5e4817b445e8e16beaf50ebcce3ca41"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "5bc78aaa0072d5ebc63365c18f3c764c1f1f33f79bb4478ca242d7f780d1614e"
  end

  depends_on "gcc"

  def install
    bin.install "astroguard.sh" => "astroguard"
  end

  test do
    assert_path_exists bin/"astroguard"
  end
end
