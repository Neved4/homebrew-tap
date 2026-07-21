class Tmexcludes < Formula
  desc "Manage Time Machine exclusions!"
  homepage "https://github.com/Neved4/tmexcludes"
  url "https://github.com/Neved4/tmexcludes/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "882e92a726195ad8fef62fe070ad54a429adaa9a85d1ac271acce897dc713ce1"
  license "MIT"
  head "https://github.com/Neved4/tmbackup.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/tmexcludes-0.1.0"
    rebuild 2
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "515072053b5b9261db3b3392b974d50bc832ddbfe7991bbda75eac383242a53f"
  end

  depends_on :macos

  def install
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"tmexcludes.sh"
    bin.install_symlink "tmexcludes.sh" => "tmexcludes"
  end

  test do
    assert_match "usage: tmexcludes <command>", shell_output("#{bin}/tmexcludes 2>&1", 1)
  end
end
