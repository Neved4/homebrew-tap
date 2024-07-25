class Alire < Formula
    desc "Ada/SPARK package manager"
    homepage "https://alire.ada.dev/"
    version "2.0.1"
    url "https://github.com/alire-project/alire/releases/download/v#{version}/alr-#{version}-bin-x86_64-macos.zip"
    sha256 "74223012ded5bf8057a7dd60856665f22e85a937a53c37678d212c60122de0c2"

    if OS.linux?
      url "https://github.com/alire-project/alire/releases/download/v#{version}/alr-#{version}-bin-x86_64-linux.zip"
      sha256 "8f4b39f42fd6969815077f91fdae087b8309eedda069ad5227374c49807792a1"
    end

    def install
      bin.install "bin/alr"
    end
end
