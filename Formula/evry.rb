class Evry < Formula
  desc "Shell-script-centric task scheduler"
  homepage "https://github.com/purarue/evry"
  url "https://github.com/purarue/evry/archive/5e3ebfbfb7a9236ab9fa7ef494fb19573d2095ca.tar.gz"
  version "0.3.5,1,5e3ebfb"
  sha256 "4223b0330bfe438d8fc547fa7ae9d7ea7610f3304091a84c6c132bff92011eab"
  license "Apache-2.0"
  head "https://github.com/purarue/evry.git", branch: "master"

  livecheck do
    skip "No tagged version available"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "A tool to manually run commands", shell_output("#{bin}/evry --help", 10)
  end
end
