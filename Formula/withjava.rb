class Withjava < Formula
  desc "Wrap commands in specific Java versions"
  homepage "https://git.arielaw.ar/arisunz/with-java"
  url "https://git.arielaw.ar/arisunz/with-java/archive/d71ed0dde95887e4d305f5bd6fd2f0e50079e436.tar.gz"
  version "0.1.0-d71ed0dde95887e4d305f5bd6fd2f0e50079e436"
  sha256 "3243dc190b5171ad5332cef672c982d505ea37a6ed2a0e56262de4eba48ff3a2"
  license "GPL-3.0-or-later"
  head "https://git.arielaw.ar/arisunz/with-java.git", branch: "main"

  livecheck do
    skip "No tagged version available"
    # url :stable
    # regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    desired_output = "with-java #{version.major_minor_patch}"
    assert_equal desired_output, shell_output("#{bin}/with-java --version").strip
  end
end
