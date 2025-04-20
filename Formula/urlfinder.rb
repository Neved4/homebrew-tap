class Urlfinder < Formula
  desc "Tool for passively gathering URLs"
  homepage "https://github.com/projectdiscovery/urlfinder"
  url "https://github.com/projectdiscovery/urlfinder/archive/refs/tags/v0.0.3.tar.gz"
  sha256 "cf97cba60ce01d5daa55dd7bb737bf534b63dc5143efd984c6c5f969650a19cb"
  license "MIT"
  head "https://github.com/projectdiscovery/urlfinder.git", branch: "dev"

  depends_on "go" => :build

  def install
    system "go", "build",
      *std_go_args(
        ldflags: "-w -s",
        gcflags: "all=-l -B -wb=false",
      ),
    "cmd/urlfinder/main.go"
  end

  test do
    desired_output = "Current Version: v#{version}"
    assert_includes shell_output("#{bin}/urlfinder --version 2>&1").strip, desired_output
  end
end
