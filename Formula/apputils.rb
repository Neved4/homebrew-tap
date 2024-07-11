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
