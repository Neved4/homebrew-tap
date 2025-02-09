class ApgGo < Formula
  desc "Modern Automated Password Generator-clone written in Go"
  homepage "https://github.com/wneessen/apg-go"
  url "https://github.com/wneessen/apg-go/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "dfe7633a6fe7fd40f9fc2ae43ce66a5d8224a732b8051f65504123fe0a95bb40"
  license "MIT"
  head "https://github.com/wneessen/apg-go.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", "apg", "github.com/wneessen/apg-go/cmd/apg"
    bin.install "apg"
    doc.install "README.md"
  end

  test do
    assert_equal 64, shell_output("#{bin}/apg -n 1 -C -m 64 -x 64").strip.length

    desired_output = "apg-go // A \"Automated Password Generator\"-clone v#{version}"
    assert_includes shell_output("#{bin}/apg -v 2>&1").strip, desired_output
  end
end
