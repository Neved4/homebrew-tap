class Apputils < Formula
  desc "Find macOS app paths!"
  homepage "https://github.com/Neved4/apputils"
  url "https://github.com/Neved4/apputils/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "2958484a7d5ae117ab409631205be325baff95304484dc6aade1f6fe28a1c14d"
  license "MIT"
  head "https://github.com/Neved4/apputils.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/apputils-0.1.0"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "ef9e3889d53c994fc2bcc2c6a13a50e382532af14d30bbd5083981457240c7d4"
    sha256 cellar: :any_skip_relocation, ventura:      "504ce46bde251c1048aebe1345e184d70c4546fb64faf7bada26953d6a3ee557"
    sha256 cellar: :any_skip_relocation, monterey:     "d01d33c43881edc26adb93384ce282943a31421685419380bc3730c725949ab0"
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
