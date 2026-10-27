class PackerTmp < Formula
  desc "Tool for creating identical machine images for multiple platforms"
  homepage "https://github.com/hashicorp/packer"
  url "https://github.com/hashicorp/packer/archive/refs/tags/v1.16.2.tar.gz"
  sha256 "de0fb9c389dee6acc24d07ae2af02a3f6c30710cba474646325371cf0d62bc78"
  license "BUSL-1.1"
  head "https://github.com/hashicorp/packer.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/packer-tmp-1.16.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "67c6d52246ce4c37f4c098c409e93e9b716489517e27684920359dd7a8ac57f9"
    sha256 cellar: :any,                 x86_64_linux: "8b305fae5aaad5d90bf6766f8a20eff67010ac24a37544970b1efac3f5098033"
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
