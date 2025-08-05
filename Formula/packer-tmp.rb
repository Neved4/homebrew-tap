class PackerTmp < Formula
  desc "Tool for creating identical machine images for multiple platforms"
  homepage "https://packer.io"
  url "https://github.com/hashicorp/packer/archive/refs/tags/v1.14.1.tar.gz"
  sha256 "1ca864b4f2aa34294257f83a37b1d56b0e9ba5b64d76f53283e1b6892c304dbf"
  license "BUSL-1.1"
  head "https://github.com/hashicorp/packer.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/packer-tmp-1.14.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ccc38a77423cc312fe5eba7fce7ddb51f162f4c411da318a3def0f61b66e08bb"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "8bf2f6092ecadb7cf969e507d6f7d3aa77703b2d3d0aa32258572161e24c7c86"
    sha256 cellar: :any_skip_relocation, ventura:       "7af30e2ec95528dd48655684f8d697e29ff68b651d40e8af593f705d83fb209a"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "f25c23d6300e3fe78b972da4687a5bc614a3fb4fb380ebd7eab77b6054b2dffe"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")

    # Allow packer to find plugins in Homebrew prefix
    bin.env_script_all_files libexec/"bin", PACKER_PLUGIN_PATH: HOMEBREW_PREFIX/"bin"

    zsh_completion.install "contrib/zsh-completion/_packer"
  end

  test do
    minimal = testpath/"minimal.json"
    minimal.write <<~JSON
      {
        "builders": [{
          "type": "amazon-ebs",
          "region": "us-east-1",
          "source_ami": "ami-59a4a230",
          "instance_type": "m3.medium",
          "ssh_username": "ubuntu",
          "ami_name": "homebrew packer test  {{timestamp}}"
        }],
        "provisioners": [{
          "type": "shell",
          "inline": [
            "sleep 30",
            "sudo apt-get update"
          ]
        }]
      }
    JSON
    system bin/"packer-tmp", "validate", "-syntax-only", minimal
  end
end
