class Evry < Formula
  desc "Shell-script-centric task scheduler"
  homepage "https://github.com/purarue/evry"
  url "https://github.com/purarue/evry/archive/5e3ebfbfb7a9236ab9fa7ef494fb19573d2095ca.tar.gz"
  version "0.3.5-1-5e3ebfb"
  sha256 "4223b0330bfe438d8fc547fa7ae9d7ea7610f3304091a84c6c132bff92011eab"
  license "Apache-2.0"
  head "https://github.com/purarue/evry.git", branch: "master"

  livecheck do
    skip "No tagged version available"
  end

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/evry-0.3.5-1-5e3ebfb"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "deacfbc2c5b346a2154abdaa612dedc4f34572a4c0768a3f43ef2124667dd2cd"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "66b7bbf66b0154c3e3d48716d77e6decb1dd3d0a0d5595e1b3e8a2510ec09452"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "5d98dd2b204ef469ced004862b3e3910a630798ec69cbd15fef4c7d00dcf1a0b"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "A tool to manually run commands", shell_output("#{bin}/evry --help", 10)
  end
end
