class TypstAnsiHl < Formula
  desc "Highlight your Typst code using ANSI escape sequences"
  homepage "https://github.com/frozolotl/typst-ansi-hl"
  url "https://github.com/frozolotl/typst-ansi-hl/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "b79ed864ed5efcd5379a8a74ea4fd358e598812baaea84bd264bc1bd133b7876"
  license "EUPL-1.2"
  head "https://github.com/frozolotl/typst-ansi-hl.git", branch: "master"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    doc.install "README.md"
  end

  test do
    desired_output = "This is \e[0m\e[3m\e[33m_\e[0mTypst_ \e[0m\e[3m\e[34m#underline\e[0m[code]."
    command = "echo 'This is _Typst_ #underline[code].' | #{bin}/typst-ansi-hl"
    assert_equal desired_output, shell_output(command).strip
  end
end
