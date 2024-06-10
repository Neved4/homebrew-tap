class Tmexcludes < Formula
  desc "Manage Time Machine exclusions!"
  homepage "https://github.com/Neved4/tmexcludes"
  url "https://github.com/Neved4/tmexcludes/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "991f8be21d3da9007bfb62f066b37dde33fdfa9d11ce0d69a73863e06cbc37c6"
  license "MIT"
  head "https://github.com/Neved4/tmbackup.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :macos

  def install
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"tmexcludes.sh"
    bin.install_symlink "tmexcludes.sh" => "tmexcludes"
  end
end
