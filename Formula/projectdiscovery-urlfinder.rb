class ProjectdiscoveryUrlfinder < Formula
  desc "Tool for passively gathering URLs"
  homepage "https://github.com/projectdiscovery/urlfinder"
  url "https://github.com/projectdiscovery/urlfinder/archive/refs/tags/v0.0.3.tar.gz"
  sha256 "cf97cba60ce01d5daa55dd7bb737bf534b63dc5143efd984c6c5f969650a19cb"
  license "MIT"
  head "https://github.com/projectdiscovery/urlfinder.git", branch: "dev"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/urlfinder-0.0.3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "dddd807a494d185db043b3faef7ef1d61b5dc0682e03f4261617c0ab10557c96"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "191826bd4a9a4b2f80158ae3912576f8490cd80e341cf797dc4815f2dbddc40d"
    sha256 cellar: :any_skip_relocation, ventura:       "7263ce15d5c4745c562f5a9f55a197a8a050e9adf4db0b82eb4521528126cbf4"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "d8d5720c8bc7c07c26adc3a0aa40e1717ff74ad89306bea968560c488452a97a"
  end

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
