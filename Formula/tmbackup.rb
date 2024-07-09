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

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/tmbackup-0.1.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "b75f4909b5fc829d2de0b6da036199480427abe428c2ae8f0045ef9753368ae2"
    sha256 cellar: :any_skip_relocation, ventura:      "f9b0b53aa9d70e9f64f4d1b48c450b0e3d9cc164c241a623dde321117b7d78e2"
    sha256 cellar: :any_skip_relocation, monterey:     "520088b0752a0c47ec08ed78f944f4d3b4ecc3544ea6e191824d30148c1330e7"
  end

  depends_on :macos

  def install
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"src/tmbackup.sh"
    bin.install_symlink "tmbackup.sh" => "tmbackup"
  end
end
