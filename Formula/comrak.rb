class Comrak < Formula
  desc "CommonMark + GFM compatible Markdown parser and renderer"
  homepage "https://github.com/kivikakk/comrak"
  url "https://github.com/kivikakk/comrak/archive/refs/tags/v0.35.0.tar.gz"
  sha256 "64dc51f2adbf3761548d9f3ab608de874db14d723e8ca6f9fbd88ebf3bff3046"
  license "BSD-2-Clause"
  head "https://github.com/kivikakk/comrak.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/comrak-0.35.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "860c36deebc9ca3ac19b80b2075186819f44b6516dd664acfa5fc6e5fa9972c0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "ee4c09d386f15abdd69c3607d2374be6e3eec46a7a69200ea18d10eeeeef408b"
    sha256 cellar: :any_skip_relocation, ventura:       "d9a2d2ae1e9e37494a79054753d38007d5c883d5c4a0c53f2aee16de3e7be87a"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "c5bace2ebfaafabfedd40966bfd0f73dd12bc50e2ccebf0b729f1fc36e53b326"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    desired_output = "<p>This <em>is</em> a <strong>test</strong>.</p>"
    command = "echo 'This *is* a **test**.' | #{bin}/comrak"
    assert_equal desired_output, shell_output(command).strip
  end
end
