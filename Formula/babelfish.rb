class Babelfish < Formula
  desc "Translate bash scripts to fish"
  homepage "https://github.com/bouk/babelfish"
  url "https://github.com/bouk/babelfish/archive/refs/tags/v1.2.1.tar.gz"
  sha256 "967a9020e905f01b0d3150a37f35d21e8d051c634eebf479bc1503d95f81a1d9"
  license "MIT"
  head "https://github.com/bouk/babelfish.git", branch: "master"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/babelfish-1.2.1"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b7d6b615c4ee1be0442655297da6fa742c085d0afa74673c96ee60702c1b1e36"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "8f347cec90f74ce1d9cc1d06c327a7cc3909c96b2edc31062fc28bc211988aef"
    sha256 cellar: :any_skip_relocation, ventura:       "14d8b33ba2f4c2745b0a11ed1432043d7b6059f31a31904e278b2d9003c35ea9"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "f736fa3a3c909c1018367a8054d4dd785d176533546d698b29988dea63d79448"
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
