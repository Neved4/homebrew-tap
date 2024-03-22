class Tmbackup < Formula
  desc "Seamless Time Machine backups!"
  homepage "https://github.com/Neved4/tmbackup"
  url "https://github.com/Neved4/tmbackup/archive/8a3878bd4333106674725ed218fe6a17ff7c65c3.tar.gz"
  sha256 "e8c66ecfb77fb02eb818d8c8784546fa7412f7943b542932f41e9849d9206795"
  license "MIT"
  head "https://github.com/Neved4/tmbackup.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :macos

  def install
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"src/tmbackup.sh"
    bin.install_symlink "tmbackup.sh" => "tmbackup"
  end
end
