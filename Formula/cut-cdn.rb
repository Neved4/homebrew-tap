class CutCdn < Formula
  desc "Remove CDN IPs from the list of IP addresses"
  homepage "https://github.com/ImAyrix/cut-cdn"
  url "https://github.com/ImAyrix/cut-cdn/archive/refs/tags/v1.0.31.tar.gz"
  sha256 "0fc090c40f6051651f3bd437bfd9462eff09fb1f2a951127ac779b8295eef049"
  license "MIT"
  version_scheme 1
  head "https://github.com/ImAyrix/cut-cdn.git", branch: "master"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
    strategy :git do |tags, regex|
      tags.filter_map do |tag|
        next if /^v?2\.0\.0$/.match?(tag)

        tag[regex, 1]
      end
    end
  end

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/cut-cdn-2.0.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "5ef21fe752d2c9c49e995434c994242cadcacefb5c6c99f4f4554d2a230654a6"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "9f5b0195b2034e2f3552d6173c160f254d779702546461ee99f2e5d4fd6c4599"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "0b90e8c5cc00528f7543563eb3418e6c5f4349c269d84fc316c8716f3909a0ec"
  end

  depends_on "go" => :build

  def install
    system "go", "build",
           *std_go_args(output: bin/"cut-cdn", ldflags: "-s -w")
  end

  test do
    output = shell_output("#{bin}/cut-cdn -version 2>&1")
    assert_match "Current Version: v#{version}", output
  end
end
