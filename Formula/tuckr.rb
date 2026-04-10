class Tuckr < Formula
  desc "Dotfile manager"
  homepage "https://github.com/RaphGL/Tuckr"
  url "https://github.com/RaphGL/Tuckr/archive/refs/tags/0.13.1.tar.gz"
  sha256 "4b3bdc51e5de5961d89021f28e5aa1ae976fe37330ffafaa5042ed7d6ee2c7c7"
  license "GPL-3.0-only"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/tuckr-0.13.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "17258e7747c3749ed84f5f7bbb058d9f78d283816931b28f06bf8ed07cce1669"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "71ba728531af6726c378ac7dbae951b2bef0ead96490be18bcaa42a2b25f901e"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "tuckr", shell_output("#{bin}/tuckr --help")
  end
end
