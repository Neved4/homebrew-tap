class ApgGo < Formula
  desc "Modern Automated Password Generator-clone written in Go"
  homepage "https://github.com/wneessen/apg-go"
  url "https://github.com/wneessen/apg-go/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "dfe7633a6fe7fd40f9fc2ae43ce66a5d8224a732b8051f65504123fe0a95bb40"
  license "MIT"
  head "https://github.com/wneessen/apg-go.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/apg-go-1.2.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b784e5afd5ab85887239894bfe781c73059b19621fe2862afd220d27fc1878fe"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "50387f827947a01d190ba002ea736f2be39f65dda1a3b893014e1136f0821de8"
    sha256 cellar: :any_skip_relocation, ventura:       "1fde078d4ebe37483b0c16f693ae255739af73211078710e9f922fd07f32e49f"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "0244aacd456d619cecf4f4d27f5f09dfad08f9c4a6a1fcb03c5e91e70addd911"
  end

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
