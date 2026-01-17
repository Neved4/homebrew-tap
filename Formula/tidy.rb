class Tidy < Formula
  desc "Combine and clean word lists"
  homepage "https://github.com/sts10/tidy"
  url "https://github.com/sts10/tidy/archive/refs/tags/v0.3.20.tar.gz"
  sha256 "0ef5624acbe496724da65a03bffab0807d8926c2bd58cf988a5ac5da345a7c69"
  license "MIT"
  head "https://github.com/sts10/tidy.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/tidy-0.3.20"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "dff9e11630171d2475cbf85736cd951b0aa493155507e0d1c70ace3fa30cdbba"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6bbaaaf1f3491ab53f24a2022128ce84a99911ff616e726129324aaf4934eecf"
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
