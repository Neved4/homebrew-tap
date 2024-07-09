class Tmbackup < Formula
  desc "Seamless Time Machine backups!"
  homepage "https://github.com/Neved4/tmbackup"
  url "https://github.com/Neved4/tmbackup/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "9530bc9f64bc1ea2d4f61a5120af745db232191a4826a8beb68ab223afb8ade8"
  license "MIT"
  version_scheme 1
  head "https://github.com/Neved4/tmbackup.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :macos

  def install
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"src/tmbackup.sh"
    bin.install_symlink "tmbackup.sh" => "tmbackup"
  end
end
