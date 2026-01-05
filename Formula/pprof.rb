class Pprof < Formula
  desc "Profiling tool for Go programs"
  homepage "https://github.com/google/pprof"
  url "https://github.com/google/pprof/archive/b05bdaca462fe6a8410d248bdc10c20e01a7b489.tar.gz"
  version "0.0.0-20251213-b05bdac"
  sha256 "e7c2ebf84a2df6ba109dbc019c24760dfa3c2c7274f0de5aad97bf561fe16375"
  license "Apache-2.0"

  livecheck do
    skip "No tagged version available"
  end

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/pprof-0.0.0-20251213-b05bdac"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "292396f58d1accea2d8aac6f05d1a5e78c2163d587129849193ea10940f0da08"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e823c474306fdf954a2e06e93d9ee55a30755ee85cfee94a1ad11057ab7ccb3b"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "3c51055ae04e1cbcc24bb702dbe1cfb72c018c02c99e2c37843eaaabf521ea19"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "."
  end

  test do
    assert_match "pprof", shell_output("#{bin}/pprof -h 2>&1")
  end
end
