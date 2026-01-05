class Tuckr < Formula
  desc "Dotfile manager"
  homepage "https://github.com/RaphGL/Tuckr"
  url "https://github.com/RaphGL/Tuckr/archive/refs/tags/0.12.0.tar.gz"
  sha256 "2b0e359185384bcbc0160a2074dbf4c1e8fdde98c4d1a74ccb0a5af7ec753b00"
  license "GPL-3.0-only"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "tuckr", shell_output("#{bin}/tuckr --help")
  end
end
