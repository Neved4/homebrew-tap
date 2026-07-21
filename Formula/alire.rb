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
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/alire-2.1.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "dbb171d6876d7558065847e65c0941a012ebb7618e9bd00958985c3aad74bf51"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "5c52fb14b0ddb4c90013869f8f597a360d1ee028b6d8d84fc32fe1426ba1365c"
    sha256 cellar: :any_skip_relocation, ventura:       "5cb2fa51c6e25c8ebdf9cb6c60c815fcb002baf3399f9e7994d726e52365feea"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "f500e48a1a53ed3c5f80be183f8a93c63ddda9852ede270ec2907c75de84b7d9"
  end

  def install
    bin.install "bin/alr"
  end

  test do
    desired_output = "alr #{version}"
    assert_includes shell_output("#{bin}/alr --version").strip, desired_output
  end
end
