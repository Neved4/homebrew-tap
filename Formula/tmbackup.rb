class Tmbackup < Formula
  desc "Seamless Time Machine backups!"
  homepage "https://github.com/Neved4/tmbackup"
  url "https://github.com/Neved4/tmbackup/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "9530bc9f64bc1ea2d4f61a5120af745db232191a4826a8beb68ab223afb8ade8"
  license "MIT"
  version_scheme 1
  head "https://github.com/Neved4/tmbackup.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/tmbackup-0.1.0"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "987bc986c793c8c74f42d94c7138e14ec53f6db321079345255eeed980c78af8"
  end

  depends_on :macos

  def install
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"src/tmbackup.sh"
    bin.install_symlink "tmbackup.sh" => "tmbackup"
  end

  test do
    system "sh", "-n", bin/"tmbackup"
  end
end
