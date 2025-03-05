class Alire < Formula
  desc "Ada/SPARK package manager"
  homepage "https://alire.ada.dev/"
  url "https://github.com/alire-project/alire/releases/download/v2.1.0/alr-2.1.0-bin-x86_64-#{OS.mac? ? "macos" : "linux"}.zip"
  if OS.mac?
    sha256 "67d3389833b936a56534b7ad2ea91164b18db40318571e904fc8ab41aca7acc8"
  elsif OS.linux?
    sha256 "e3b32cb0afe981b23d1a68da77452cf81ee1d82de8ebaf01c5e233be8b463fbe"
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
