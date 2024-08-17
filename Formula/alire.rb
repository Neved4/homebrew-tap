class Alire < Formula
  desc "Ada/SPARK package manager"
  homepage "https://alire.ada.dev/"
  url "https://github.com/alire-project/alire/releases/download/v2.0.1/alr-2.0.1-bin-x86_64-macos.zip"
  sha256 "74223012ded5bf8057a7dd60856665f22e85a937a53c37678d212c60122de0c2"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/alire-2.0.1"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "fa8258efcbaeef63b8e4f217ab71487cf218b45febb6ec386ae406aeef5ab7aa"
    sha256 cellar: :any_skip_relocation, ventura:      "2cb31e6126253e2e953e0a004ebdc54311722d62c55e54e52be72ecf705441b4"
    sha256 cellar: :any_skip_relocation, monterey:     "fe974b239506bc2fa517426645efa2b4997bf3db819c43d4c49916a1529be8ca"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5c0ebe6c7510af54cb7a6fd1a87423045e225f95a8cb5a4142ec9e8dad7f324e"
  end

  if OS.linux?
    url "https://github.com/alire-project/alire/releases/download/v#{version}/alr-#{version}-bin-x86_64-linux.zip"
    sha256 "8f4b39f42fd6969815077f91fdae087b8309eedda069ad5227374c49807792a1"
  end

  livecheck do
    url :url
    strategy :github_latest
  end

  def install
    bin.install "bin/alr"
  end

  test do
    desired_output = "alr #{version}"
    assert_equal desired_output, shell_output("#{bin}/alr --version").strip
  end
end
