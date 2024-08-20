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

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/withjava-0.1.0-d71ed0dde95887e4d305f5bd6fd2f0e50079e436"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "2080409cbeb3890c4eeda79aae69c5c53b929bbc47a8e8aa0e7038b302b0d974"
    sha256 cellar: :any_skip_relocation, ventura:      "ad46a3b6aa568cf48dba9a244b348cd5e74870cf74b1c97cbd434b04614fdb21"
    sha256 cellar: :any_skip_relocation, monterey:     "302799d37d9fece35dd1c234ae87bdbea0e6c99f18692f4675fab5fe1e55eb86"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "bb969f32f130c43194f37cc6216c93ceb21b869809b8c76299404b0188464af7"
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
