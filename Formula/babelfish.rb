class Babelfish < Formula
  desc "Translate bash scripts to fish"
  homepage "https://github.com/bouk/babelfish"
  url "https://github.com/bouk/babelfish/archive/refs/tags/v1.2.1.tar.gz"
  sha256 "967a9020e905f01b0d3150a37f35d21e8d051c634eebf479bc1503d95f81a1d9"
  license "MIT"
  head "https://github.com/bouk/babelfish.git", branch: "master"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/babelfish-1.2.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f613208c8f9c9e877ddaa3fe3c51b7cf63712813910fe3260d67e15535bdb552"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "4eab6ed062985b36e62b2804b57d94767802299c4b3ce740e7aea08d1836a340"
    sha256 cellar: :any_skip_relocation, ventura:       "79cec3f8a1587dcd122ef6a00e2324ed31223865c83faae589d18dcf24d02e53"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "1f639a94755a91f0589c575ec10fcbf7c5c0430e67f648963b765cfd532f09ab"
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

        $ source /opt/homebrew/share/fish/vendor_functions.d/babel.fish

      This allows you to run a bash script like this:

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
