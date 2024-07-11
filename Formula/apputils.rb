class Apputils < Formula
  desc "Find macOS app paths!"
  homepage "https://github.com/Neved4/apputils"
  url "https://github.com/Neved4/apputils/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "1999cbf9d8503481aae148170d23840a8164a1caf88cb660a41c2ee436880a28"
  license "MIT"
  head "https://github.com/Neved4/apputils.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/apputils-0.1.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "21417f1ec4c717e1e85f96fecc20ec3bc5ecfecfa1e3ce99295fba8ef3614171"
    sha256 cellar: :any_skip_relocation, ventura:      "74fa35695677c0c4eed152dc7a44ab625b8324087b8abe7c5a73da661551d720"
    sha256 cellar: :any_skip_relocation, monterey:     "b9fc976c6aa5c572fa6b899e1afc49ff7b4021838c8244f3b04245bab8aa0137"
  end

  depends_on :macos

  def install
    bin.install "app.sh" => "app"
    doc.install "README.md"
  end

  test do
    list_desired_output_includes = "/System/Applications/Utilities/Terminal.app"
    assert_includes shell_output("#{bin}/app list").strip, list_desired_output_includes

    find_desired_output = "/System/Applications/App Store.app"
    assert_equal find_desired_output, shell_output("#{bin}/app find 'App Store'").strip

    dir_desired_output = "/System/Applications"
    assert_equal dir_desired_output, shell_output("#{bin}/app dir 'App Store'").strip
  end
end
