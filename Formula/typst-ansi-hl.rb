class TypstAnsiHl < Formula
  desc "Highlight your Typst code using ANSI escape sequences"
  homepage "https://github.com/frozolotl/typst-ansi-hl"
  url "https://github.com/frozolotl/typst-ansi-hl/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "312cd936305dfa7abc584f29bc4eb7703c84a141ae33dbd22b17efe9ad3ab56b"
  license "EUPL-1.2"
  head "https://github.com/frozolotl/typst-ansi-hl.git", branch: "master"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/typst-ansi-hl-0.4.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "237e7e2b7e10f707db0734d6e01b1970fa37128195c7521628d4f783efcfb622"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "161fcbc85c90b4af853b09fd62a491fd920c76fc17ea92ce74cf0261c2a47666"
    sha256 cellar: :any_skip_relocation, ventura:       "3f39f59578899af9f28c06fb4ef2f9d19735c7a74d45f83d48de5cf2b59bbbfc"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "1c367a44c522aa8c26366b23b7d1a34acf97980b9883e88ceae9754ae8915d81"
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
