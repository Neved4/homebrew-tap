class Babelfish < Formula
  desc "Translate bash scripts to fish"
  homepage "https://github.com/bouk/babelfish"
  url "https://github.com/bouk/babelfish/archive/refs/tags/v1.2.1.tar.gz"
  sha256 "967a9020e905f01b0d3150a37f35d21e8d051c634eebf479bc1503d95f81a1d9"
  license "MIT"
  head "https://github.com/bouk/babelfish.git", branch: "master"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/babelfish-1.2.1"
    rebuild 2
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "38c285feced4d672c463bfd40dd79c36bbf747f2d33227b8ad9c9a7974ed780b"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "41a44990b818f70739757a4834e67f58a7857d32ab788d890a38d0ec4fbd3283"
    sha256 cellar: :any_skip_relocation, ventura:       "0aae0b9bca4d618a4009af04b115f8f2ca91160df6994084d845a5bcbad61800"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "54ac585acc71323f1866f85e6e64a5aa804dce42d210b508864d785cf0fdaf9b"
  end

  depends_on "go" => :build
  depends_on "fish" => :test

  def install
    system "go", "build",
      *std_go_args(
        ldflags: "-w -s",
        gcflags: "all=-l -B -wb=false",
      )
    doc.install "README.md"
    fish_function.install "babel.fish"
  end

  def caveats
    <<~CAVEATS
      The shell hook has been installed, you can use it by running:

        $ source #{HOMEBREW_PREFIX}/share/fish/vendor_functions.d/babel.fish

      Then you can run shell scripts like this:

        $ source chruby.sh
        $ chruby
           ruby-2.5
           ruby-2.6
           ruby-2.7
    CAVEATS
  end

  test do
    desired_output = "worked!"
    command = "echo 'example() { test=\"worked!\"; echo $test; }; example' | #{bin}/babelfish | fish"
    assert_equal desired_output, shell_output(command).strip
  end
end
