class Koino < Formula
  desc "CommonMark + GFM compatible Markdown parser and renderer"
  homepage "https://github.com/kivikakk/koino"
  url "https://github.com/kivikakk/koino/archive/0151bb37714d93688f31e3d7a3d0369106818f26.tar.gz"
  sha256 "3f98f9eb38350dab8fd3718df26e7cef2a96caf30f2baf12aa62f2c773fecf2a"
  license "MIT"
  # brew wants `main` which won't actually build on zig >=0.13.0
  #head "https://github.com/kivikakk/koino.git", branch: "zig-0.13.0"

  livecheck do
    skip "No tagged version available"
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
