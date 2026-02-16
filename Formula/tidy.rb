class Tidy < Formula
  desc "Combine and clean word lists"
  homepage "https://github.com/sts10/tidy"
  url "https://github.com/sts10/tidy/archive/refs/tags/v0.3.24.tar.gz"
  sha256 "dbe180e9a6ea97d472881dcba0059c19135ef2b110e13b1827a7a8e8772de113"
  license "MIT"
  head "https://github.com/sts10/tidy.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/tidy-0.3.24"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "fa0c347c6912503c5a15e84c477784ee9b70693bbb257ea8c2884b0a0fb22794"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0150e5dea4247e8f72e9a7949a37c895932d6f7c143d7dcb19d82520d7fd5f09"
  end

  keg_only "conflicts with wordtidy"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_equal "tidy #{version}", shell_output("#{bin}/tidy --version").strip
  end
end
