class Wordlists < Formula
  desc "Collection of common wordlists"
  homepage "https://www.kali.org/tools/wordlists/"
  url "https://gitlab.com/kalilinux/packages/wordlists/-/archive/kali/2025.4.0/wordlists-kali-2025.4.0.tar.gz"
  sha256 "bc30fa77ec18d1c6b25c4fce28664a2f4cc6d35fad5f026907fba0fac2ddc6e9"
  license :cannot_represent

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/wordlists-2025.4.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "9d7faa3631950897b52de0a1ccd45cb7c5bc8b37626a1a7172769b6ea3043d30"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f01054a7e670280ee6053264a41203b34282a316ee341816af4a73c8d510f32c"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "1100e875698d31e57a254a0705e29fc958cec0c270108626fc1aa7e30394dcc0"
  end

  def install
    pkgshare.install Dir["*"]
  end

  test do
    assert_path_exists pkgshare/"README.md"
    assert_path_exists pkgshare/"rockyou.txt.gz"
  end
end
