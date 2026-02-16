class Tuckr < Formula
  desc "Dotfile manager"
  homepage "https://github.com/RaphGL/Tuckr"
  url "https://github.com/RaphGL/Tuckr/archive/refs/tags/0.13.0.tar.gz"
  sha256 "8878bbe5017e9c34227598eda489f6e0b18e364d7ac75cc4488efbae91b630c8"
  license "GPL-3.0-only"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/tuckr-0.13.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "f34958855f438b76c55c755bb5730d70f94daf7084a54e07a2565f7292388207"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "046986fa45341dc5a01c2bb22292992afaf1c892cc905322668474aa5a0ad4d0"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "tuckr", shell_output("#{bin}/tuckr --help")
  end
end
