class Doas < Formula
  desc "Execute commands as another user"
  homepage "https://github.com/slicer69/doas"
  url "https://github.com/slicer69/doas/archive/refs/tags/6.3p12.tar.gz"
  version "6.3p12"
  sha256 "e4f37745345c12d4e0c8c03c8237791729cf047dbd7b2455f8de60e2f82ac1b0"
  license "BSD-2-Clause"
  head "https://github.com/slicer69/doas.git", branch: "master"

  livecheck do
    url :stable
  end

  depends_on :macos

  def install
    system "make", "all"
    bin.install "doas"
    man1.install "doas.1"
    man1.install "doas.conf.5"
    bin.install "doasedit"
    man1.install "doasedit.8"
    bin.install "vidoas"
    man1.install "vidoas.8"
  end

  def caveats
    <<~EOS
      To complete the installation, run the following commands manually with sudo:
        sudo cp /etc/pam.d/sudo /etc/pam.d/doas
    EOS
  end
end
