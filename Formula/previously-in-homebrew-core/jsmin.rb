class Jsmin < Formula
  desc "Minify JavaScript code"
  homepage "https://www.crockford.com/javascript/jsmin.html"
  url "https://github.com/douglascrockford/JSMin/archive/430bfe68dc0823d8c0f92c08d426e517cbc8de5e.tar.gz"
  version "2019-10-30"
  sha256 "24e3ad04979ace5d734e38b843f62f0dc832f94f5ba48642da31b4a33ccec9ac"
  license "JSON"

  # The GitHub repository doesn't contain any tags, so we have to check the
  # date in the comment at the top of the `jsmin.c` file.
  livecheck do
    url "https://raw.githubusercontent.com/douglascrockford/JSMin/master/jsmin.c"
    regex(/jsmin\.c\s*(\d{4}-\d{1,2}-\d{1,2})/im)
  end

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/jsmin-2019-10-30"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b8fd2a0f889cbbec31cfb083cfa9153f346f3b90a54680928f3c7264acc5b2eb"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "8413b1c5add7a4c914af8f0ec55848504ac0091ad9635f96bd7b0ba05557d749"
    sha256 cellar: :any_skip_relocation, ventura:       "ec01db30276149860f44cf41bcb5fa17fe895f34a39ddd6ae7b0b541e7d12885"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "ad57c5ccb98bae6ba1d802935e573275b029a0789a05b43e41df50687d65d6e6"
  end

  def install
    system ENV.cc, "jsmin.c", "-o", "jsmin"
    bin.install "jsmin"
  end

  test do
    assert_equal "\nvar i=0;", pipe_output(bin/"jsmin", "var i = 0; // comment")
  end
end
