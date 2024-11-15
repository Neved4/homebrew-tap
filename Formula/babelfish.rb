class Babelfish < Formula
  desc "Translate bash scripts to fish"
  homepage "https://github.com/bouk/babelfish"
  url "https://github.com/bouk/babelfish/archive/refs/tags/v1.2.1.tar.gz"
  sha256 "967a9020e905f01b0d3150a37f35d21e8d051c634eebf479bc1503d95f81a1d9"
  license "MIT"
  head "https://github.com/bouk/babelfish.git", branch: "master"

  depends_on "go" => :build
  depends_on "fish" => :test

  def install
    system "go", "build",
      *std_go_args(
        ldflags: "-w -s",
        gcflags: "all=-l -B -wb=false",
      )
    doc.install "README.md"
  end

  test do
    desired_output = "worked!"
    command = "echo 'example() { local test=\"worked!\"; echo $test; }; example' | #{bin}/babelfish | fish"
    assert_equal desired_output, shell_output(command).strip
  end
end
