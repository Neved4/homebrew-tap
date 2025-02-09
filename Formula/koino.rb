class Koino < Formula
  desc "CommonMark + GFM compatible Markdown parser and renderer"
  homepage "https://github.com/kivikakk/koino"
  url "https://github.com/kivikakk/koino/archive/0151bb37714d93688f31e3d7a3d0369106818f26.tar.gz"
  sha256 "3f98f9eb38350dab8fd3718df26e7cef2a96caf30f2baf12aa62f2c773fecf2a"
  license "MIT"
  # brew wants `main` which won't actually build on zig >=0.13.0
  # head "https://github.com/kivikakk/koino.git", branch: "zig-0.13.0"

  livecheck do
    skip "No tagged version available"
  end

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/koino-26"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f8d33701e7353be5037ab39cf40d4b7d98c4371e056024bd1c3f7b9b92d46e44"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "9235cb4dcc828434d876064458a6794fb5e34a4e7c4259b99be0dce60e3c6cfa"
    sha256 cellar: :any_skip_relocation, ventura:       "a9525221b18824f69312a07bc6a1dc41a71e9ba6ec62e5a4f1fc1f0752e73b70"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "93243b5eafe2cff49f15bc67a0bb6eff39a8c30fd95e9f34fbd00fa15848c54c"
  end

  depends_on "zig" => :build

  def install
    system "zig", "build", "-Doptimize=ReleaseSafe"

    bin.install "zig-out/bin/koino"
  end

  test do
    desired_output = "<p>This <em>is</em> a <strong>test</strong>.</p>"
    command = "echo 'This *is* a **test**.' | #{bin}/koino"
    assert_equal desired_output, shell_output(command).strip
  end
end
