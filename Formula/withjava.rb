class Withjava < Formula
  desc "Wrap commands in specific Java versions"
  homepage "https://git.arielaw.ar/arisunz/with-java"
  url "https://git.arielaw.ar/arisunz/with-java/releases"
  sha256 "4712f565f871bcfd32042cd1e0f0829c783814fae143583b11cf922e4b9480fc"
  license "GPL-3.0-or-later"
  head "https://git.arielaw.ar/arisunz/with-java.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on "rustup" => :build

  def install
    system "cargo", "install", "--path", "."
    bin.install "with-java"
  end
end
