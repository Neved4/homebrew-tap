class Comrak < Formula
  desc "CommonMark + GFM compatible Markdown parser and renderer"
  homepage "https://github.com/kivikakk/comrak"
  url "https://github.com/kivikakk/comrak/archive/refs/tags/v0.32.0.tar.gz"
  sha256 "06a495cbdcded18a11322d58d8b44f3ca117b2fab6ed1fcc627f9098dbde6bed"
  license "BSD-2-Clause"
  head "https://github.com/kivikakk/comrak.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/comrak-0.31.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c1aad03647f596eb8a96795d0ad93ec0a8951c9c4334d0b61daaed71c481f301"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "4ab6a82f840cc7ae071f39c542269d9061ed8f11925bc5dbf83414bad9be6af3"
    sha256 cellar: :any_skip_relocation, ventura:       "ab9da3c08e3976f2bb584bd5d0773cc79476886534207a53bc8a3e830d2abc92"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "de3c06f523ad78bec2f8329aca5dfce9cac67c4f297cd2a8be9a90e48bbe5980"
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
