class Gochro < Formula
  desc "Chrome cookie decryptor"
  homepage "https://github.com/firefart/gochro"
  url "https://github.com/firefart/gochro/archive/57ed4cdfc30ad3bdc8f33badc321fc5889a72bc0.tar.gz"
  version "0.0.0-20251209-57ed4cd"
  sha256 "65dbbea69975c13fec19ef7f3e666f4d9e3568a2d028a9b918f45f3f5e3cf6c2"
  license "MIT"

  livecheck do
    skip "No tagged version available"
  end

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/gochro-0.0.0-20251209-57ed4cd"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "e0754b1fa2b8931b3aa82a792ff7419d994cbfca2add43e4d5fef2cb5dd8b29e"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8a55cb70a76dca70b7e31801f7108b5c2ea7f003716089d505ef736640d04834"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "d24360bfc3cb89030fa447acd6f896c7019c85820dd15fd26bd354c2bc154f22"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "."
  end

  test do
    assert_match "gochro", shell_output("#{bin}/gochro -h 2>&1")
  end
end
