class TypstAnsiHl < Formula
  desc "Highlight your Typst code using ANSI escape sequences"
  homepage "https://github.com/frozolotl/typst-ansi-hl"
  url "https://github.com/frozolotl/typst-ansi-hl/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "b79ed864ed5efcd5379a8a74ea4fd358e598812baaea84bd264bc1bd133b7876"
  license "EUPL-1.2"
  head "https://github.com/frozolotl/typst-ansi-hl.git", branch: "master"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/typst-ansi-hl-0.2.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "43fb932693b87d7c93e4f75b8eb8df82bbd6952706d01f43ba8877bd026ed79b"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "d4de0bb2e151596fc576fc24c3b220ea3dd5a9c8187356c60f0630aa478b35be"
    sha256 cellar: :any_skip_relocation, ventura:       "4932643818528e6f9fe20e6402e1124d5262a78948f6626c50c18da3324d0395"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "19fea07d8aa957f5f869cbf9a71a2399032f7371e034a1b6b5cf3e549712f25c"
  end

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
