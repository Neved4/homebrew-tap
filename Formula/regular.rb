class Regular < Formula
  desc "Job scheduler: an alternative to cron and anacron"
  homepage "https://github.com/dbohdan/regular"
  url "https://github.com/dbohdan/regular/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "c0840f9bbf447fff87305cc3f8bc465c5fd33901092587356763a558b1d4da4e"
  license "MIT"
  head "https://github.com/dbohdan/regular.git", branch: "master"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/regular-0.1.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "3c692c88272fae8e47880935943dd4006cd8db23335496496dfd169760778a7e"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "e358641a87d54e69341a0989c241debe51f0a8e7e3562723da1f2b70b4e1548e"
    sha256 cellar: :any_skip_relocation, ventura:       "34d629e5030cdb17327b8424c91adcdd58f3de36a57dc215906d3704894d4050"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "9f3df58f5b90f7adfd2633f9b0acb44f233ab276ea4a8353ed5c41a3ac8387b5"
  end

  depends_on "go" => :build

  def install
    system "go", "build",
      *std_go_args(
        ldflags: "-w -s",
        gcflags: "all=-l -B -wb=false",
      )
  end

  test do
    desired_output = version.to_s
    assert_equal desired_output, shell_output("#{bin}/regular --version").strip
  end
end
