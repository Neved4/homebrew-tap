class Withjava < Formula
  desc "Wrap commands in specific Java versions"
  homepage "https://crates.io/crates/with-java"
  url "https://static.crates.io/crates/with-java/with-java-0.1.1.crate"
  sha256 "dff33c4cb192c645bb7b44c724001033a34d4e5b88375e77a29a1c4400300b42"
  license "GPL-3.0-or-later"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_equal "with-java 0.1.1", shell_output("#{bin}/with-java --version").strip
  end
end
