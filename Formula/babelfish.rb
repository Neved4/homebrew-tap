class Babelfish < Formula
  desc "Translate bash scripts to fish"
  homepage "https://github.com/bouk/babelfish"
  url "https://github.com/bouk/babelfish/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "349e142b200ef138c0045e1b6fc989aad81c0764ba65796e2e384e456f091123"
  license "MIT"
  head "https://github.com/bouk/babelfish.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build",
      *std_go_args(ldflags: "-w -s", gcflags: "all=-l -B -wb=false")
    doc.install "README.md"
  end
end
