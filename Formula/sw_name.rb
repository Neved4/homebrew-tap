class SwName < Formula
  desc "Print macOS friendly names!"
  homepage "https://github.com/Neved4/sw_name"
  url "https://github.com/Neved4/sw_name/archive/ae6b7f0804452b5aacc0cccb55aae7dbcc717869.tar.gz"
  sha256 "b3172572a172586b9ddbac7e129786d5469a3c9db86ac0fa67d8aaea8cd200ae"
  license "MIT"
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
