class Regular < Formula
  desc "Job scheduler: an alternative to cron and anacron"
  homepage "https://github.com/dbohdan/regular"
  url "https://github.com/dbohdan/regular/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "53d9a144c0d4d86f9cf33ffced9e3881dbe304997d3e9c0a185397798d8e10d5"
  license "MIT"
  head "https://github.com/dbohdan/regular.git", branch: "master"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/regular-0.2.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f018d3bc7dd3947d94a1d930cdeb4355b13430168a7eca334d0614787ad768bc"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "ad6c057a3e7450cd847e8d355b6a7b9a04bb42280ee699bd988359a7c0d6c4d5"
    sha256 cellar: :any_skip_relocation, ventura:       "6298a6f07b21554c22b9644582b2a1cd48b945cadfacf2ae4002406da0cd2469"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "bfc9d6f9ad28814cc2f003e5cff2207a82743c641c35c051bf695d7b052599af"
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
