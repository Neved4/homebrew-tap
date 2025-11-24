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
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/cut-cdn-1.0.31"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "afb1a4c01ff3370b11f88e872afb8cd40b79e51eb4095a729ff27a78d56ad1ae"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1c2000f544e76282d955e1cf5079ef7325d888dde3d0990c52f5fdabb7a30b63"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "9f2c9367ca9c0ac65b4362712246ca246e525a9dd48810d735177888da729e60"
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
