class Comrak < Formula
  desc "CommonMark + GFM compatible Markdown parser and renderer"
  homepage "https://github.com/kivikakk/comrak"
  url "https://github.com/kivikakk/comrak/archive/refs/tags/v0.32.0.tar.gz"
  sha256 "06a495cbdcded18a11322d58d8b44f3ca117b2fab6ed1fcc627f9098dbde6bed"
  license "BSD-2-Clause"
  head "https://github.com/kivikakk/comrak.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/comrak-0.32.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "822166a329d0e92c7c7a3cb154e92fb6d97d3e347bf6dccc96b2ab07a57c894e"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "d5c640b1b1310c1bc2124f77c54b86d0ccbc76a565bf210a8ca366e241a3d2c4"
    sha256 cellar: :any_skip_relocation, ventura:       "a932eb69b5f151ac8d8072e2c3d2796e4dee6ffe61e5e44de2ab02b2628e4587"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "5f979af8ee59d18eeadf71fbddb62f609c9d34c4ed54533c749b4355a153e709"
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
