class Cronie < Formula
  desc "Cron daemon and tools"
  homepage "https://github.com/cronie-crond/cronie"
  url "https://github.com/cronie-crond/cronie/archive/refs/tags/v4.3.tar.gz"
  sha256 "5b6be46e0d24b4efb51d2e7c95d2ded3952cbdf0f4257a1f944de50f2610b210"
  license "ISC"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/cronie-4.3"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "825ef6afcf04bc6a03ec03c86513ecc5325966763e9bff34cb8fde9a1237cbe7"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "5c3c5ad0fce1381e934c43b2fa1742fe70bdfcf7f7dd80dd3844ba9dc54ee902"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "b421a06a2fbd9fd5622cb85521e58fbbd7161e5a1232a87bb60bd1c57ef9586c"
  end

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build

  def install
    ENV.append "CFLAGS", "-Wno-implicit-int"
    system "autoreconf", "-fiv"
    system "./configure", "--prefix=#{prefix}", "--disable-silent-rules"
    system "make", "install"
  end

  test do
    assert_path_exists sbin/"crond"
  end
end
