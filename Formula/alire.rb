class Alire < Formula
  desc "Ada/SPARK package manager"
  homepage "https://alire.ada.dev/"
  url "https://github.com/alire-project/alire/releases/download/v2.1.0/alr-2.1.0-bin-x86_64-macos.zip"
  sha256 "67d3389833b936a56534b7ad2ea91164b18db40318571e904fc8ab41aca7acc8"

  if OS.linux?
    url "https://github.com/alire-project/alire/releases/download/v#{version}/alr-#{version}-bin-x86_64-linux.zip"
    sha256 "579de127341a1a684e07410b8b7a15ea7c2b39c47fd1a21179202203afe4be23"
  end

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/alire-2.0.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ef6d63dd457b45c6e1f04eb2fa911f81428c0db5e71b3cabbd3094b1a7bc0d4d"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "7d2e035078de2501bd19b13863afb22460d3e816d1660edf211aec4f1b7cfb27"
    sha256 cellar: :any_skip_relocation, ventura:       "45a77511188ba7a2e6d554ce604ce372b52178d633d21441fe4b223e9533d7b3"
    sha256 cellar: :any_skip_relocation, monterey:      "7ba10c07676677ff770a8526a6feeb0168a7bc987c0632898cd8c3c57c8dfd29"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "52258fd08137393431eca76b2f06e7e2852e21fbe480c49321b4bbfec10ad292"
  end

  def install
    bin.install "bin/alr"
  end

  test do
    desired_output = "alr #{version}"
    assert_includes shell_output("#{bin}/alr --version").strip, desired_output
  end
end
