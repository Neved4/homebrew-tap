class Withjava < Formula
  desc "Wrap commands in specific Java versions"
  homepage "https://crates.io/crates/with-java"
  url "https://static.crates.io/crates/with-java/with-java-0.1.1.crate"
  sha256 "dff33c4cb192c645bb7b44c724001033a34d4e5b88375e77a29a1c4400300b42"
  license "GPL-3.0-or-later"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/withjava-0.1.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "4637ab9dbc50bd1845985e7f2901ba2c3ae18ffbee0adad8dcef66c5161bb616"
    sha256 cellar: :any,                 x86_64_linux: "b337df132795bd2c8a01ab16903a6c7824599158ee8056090d0a8ea326f63a7e"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_equal "with-java 0.1.1", shell_output("#{bin}/with-java --version").strip
  end
end
