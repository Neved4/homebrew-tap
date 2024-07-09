class SwName < Formula
  desc "Print macOS friendly names!"
  homepage "https://github.com/Neved4/sw_name"
  url "https://github.com/Neved4/sw_name/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "974284d54bdc02cd9f4d4e6e150120c706b6f25bcdfc0089a96680bc6bf719e8"
  license "MIT"
  version_scheme 1
  head "https://github.com/Neved4/sw_name.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :macos

  def install
    bin.install "src/sw_name.sh" => "sw_name"
    doc.install "README.md"
  end

  test do
    desired_output = shell_output("sw_vers --productVersion").strip
    assert_equal desired_output, shell_output("#{bin}/sw_name --productVersion").strip
  end
end
