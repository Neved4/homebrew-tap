class Comrak < Formula
  desc "CommonMark + GFM compatible Markdown parser and renderer"
  homepage "https://github.com/kivikakk/comrak"
  url "https://github.com/kivikakk/comrak/archive/refs/tags/v0.33.0.tar.gz"
  sha256 "52f3a8aa79dbde40c3a3f8ea540098150a2b7049cb30f41ec32ea56399dd8c81"
  license "BSD-2-Clause"
  head "https://github.com/kivikakk/comrak.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/comrak-0.33.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "3e789840061bf886259d389092b6918101688388ab550eb7579a8cf609bd9d13"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "fd79778218a0b8412b009e026559cfad1eca46743a7851881e24c98c233c5742"
    sha256 cellar: :any_skip_relocation, ventura:       "1d70ec59ffbb32af5c03e628f2ddf88c6cd9bc5160b16adfe68b580dee817b24"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "fe7cd4966427f744a1c2d0417973d66de70d8e2035d7e6841336c1f00c5afc34"
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
