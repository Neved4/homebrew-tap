class Regular < Formula
  desc "Job scheduler: an alternative to cron and anacron"
  homepage "https://github.com/dbohdan/regular"
  url "https://github.com/dbohdan/regular/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "b4cd576a8aa0580a9df41d6c48aec363ae2078deeb081c62cc8938973d32bc01"
  license "MIT"
  head "https://github.com/dbohdan/regular.git", branch: "master"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/regular-0.4.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "727ccf69a71c6d2a8d3e6e49067c83166eefbd49550b7e205ae8a8edcc841490"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ecefad5784e8250eb34e45148c36869a0ccbae05910b56f7a789aa62a5d7afcb"
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
