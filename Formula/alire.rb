class Alire < Formula
  desc "Ada/SPARK package manager"
  homepage "https://alire.ada.dev/"
  url "https://github.com/alire-project/alire/releases/download/v2.0.1/alr-2.0.1-bin-x86_64-macos.zip"
  sha256 "74223012ded5bf8057a7dd60856665f22e85a937a53c37678d212c60122de0c2"

  if OS.linux?
    url "https://github.com/alire-project/alire/releases/download/v#{version}/alr-#{version}-bin-x86_64-linux.zip"
    sha256 "8f4b39f42fd6969815077f91fdae087b8309eedda069ad5227374c49807792a1"
  end

  livecheck do
    url :url
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/alire-2.0.1"
    rebuild 2
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "e1380f80450080f3450d30fecc2016190c434817813e7bdcf9fde31d1c4decda"
    sha256 cellar: :any_skip_relocation, ventura:      "fea03ea124aa2aa239bc48ec7b2c56d1127534ff9585c3fd762023776d912720"
    sha256 cellar: :any_skip_relocation, monterey:     "217ac6e0f9eaa7cfb938cd07e115802fdaa05ac24cfa8820edd025989ca97e8c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "63a576a75faf669e280d51730d09ccccfd93848402b0af9dfa7d0feca2676f9d"
  end

  def install
    bin.install "bin/alr"
  end

  test do
    desired_output = "alr #{version}"
    assert_equal desired_output, shell_output("#{bin}/alr --version").strip
  end
end
