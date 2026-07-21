class Alire < Formula
  desc "Ada/SPARK package manager"
  homepage "https://alire.ada.dev/"
  url "https://github.com/alire-project/alire/releases/download/v2.1.1/alr-2.1.1-bin-x86_64-#{OS.mac? ? "macos" : "linux"}.zip"
  if OS.mac?
    sha256 "d3e16cdfaf0cfb2da62853b79b62910189fdca9d5fddc5c3ac5974ffc7d9544b"
  elsif OS.linux?
    sha256 "09c66bcd8c35dd4b97b72c3d9b76e44caa6964a2db35aba069f396f00f1f64c7"
  end

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/alire-2.1.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "5c3987e02af785140df1bb494958ceb8111fded79e5940edc02c906efb2001b3"
    sha256 cellar: :any,                 x86_64_linux: "2bd0488ed303e04da39772510c3e1007c8e878812eadd5a721e6ce585ac83f03"
  end

  def install
    bin.install "bin/alr"
  end

  test do
    desired_output = "alr #{version}"
    assert_includes shell_output("#{bin}/alr --version").strip, desired_output
  end
end
