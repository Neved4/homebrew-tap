class Tmexcludes < Formula
  desc "Manage Time Machine exclusions!"
  homepage "https://github.com/Neved4/tmexcludes"
  url "https://github.com/Neved4/tmexcludes/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "882e92a726195ad8fef62fe070ad54a429adaa9a85d1ac271acce897dc713ce1"
  license "MIT"
  head "https://github.com/Neved4/tmbackup.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/tmexcludes-0.1.0"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "1bfa573e6e95ce4a9b06ba6da018a7d5aeec27331127d2c22d9acfff1ee39e26"
    sha256 cellar: :any_skip_relocation, ventura:      "6a20f1fbc8e8df70768ebaa4c3f76c6cd6282457cb11b5854502f30da78a4469"
    sha256 cellar: :any_skip_relocation, monterey:     "f004b7f71f9d51537276df6d66ac25bfb52f289f3ed53974c3d51150811689e4"
  end

  depends_on :macos

  def install
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"tmexcludes.sh"
    bin.install_symlink "tmexcludes.sh" => "tmexcludes"
  end
end
