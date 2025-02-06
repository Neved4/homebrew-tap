class Regular < Formula
  desc "Job scheduler: an alternative to cron and anacron"
  homepage "https://github.com/dbohdan/regular"
  url "https://github.com/dbohdan/regular/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "c0840f9bbf447fff87305cc3f8bc465c5fd33901092587356763a558b1d4da4e"
  license "MIT"
  head "https://github.com/dbohdan/regular.git", branch: "master"

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
