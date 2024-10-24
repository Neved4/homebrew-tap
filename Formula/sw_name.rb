class SwName < Formula
  desc "Print macOS friendly names!"
  homepage "https://github.com/Neved4/sw_name"
  url "https://github.com/Neved4/sw_name/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "974284d54bdc02cd9f4d4e6e150120c706b6f25bcdfc0089a96680bc6bf719e8"
  license "MIT"
  version_scheme 1
  head "https://github.com/Neved4/sw_name.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/sw_name-0.1.0"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "2d1b59d9b48ad0e688a9129c53ee43eb76cbcc8bf5e2fd56b5b5c44538036273"
    sha256 cellar: :any_skip_relocation, ventura:      "3c453a0276bc85e7de68de5e8a1c4deb1a0c55b6c6308a976a7a2378ec055651"
    sha256 cellar: :any_skip_relocation, monterey:     "c7e47048aad7b79f077eebc06886979748249d1e9574ba969bc02588e237cdb9"
  end

  depends_on :macos

  def install
    bin.install "src/sw_name.sh" => "sw_name"
    doc.install "README.md"
  end

  test do
    desired_output = shell_output("sw_vers -productVersion").strip
    assert_equal desired_output, shell_output("#{bin}/sw_name --productVersion").strip
  end
end
