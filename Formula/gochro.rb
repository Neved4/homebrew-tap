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

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "."
  end

  test do
    assert_match "gochro", shell_output("#{bin}/gochro -h 2>&1")
  end
end
