class Regular < Formula
  desc "Job scheduler: an alternative to cron and anacron"
  homepage "https://github.com/dbohdan/regular"
  url "https://github.com/dbohdan/regular/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "11a18b113b295f53122960b447793db8d5e4ec5251a6e454e9445f2b4ced07c7"
  license "MIT"
  head "https://github.com/dbohdan/regular.git", branch: "master"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/regular-0.3.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "8dcf4ad975bb63c2666077d412f48b67ef0d5f176ba537e31def0239736540c0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "9d0c4475f9730c4a02cc3be9c928d97755a44d1077f482f2123b790cad6486ea"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "495f080504915c4dcf8a19c41e3ae59186054934ef969c423c9b1e7f1806d5b3"
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
