class Packer < Formula
  desc "Tool for creating identical machine images for multiple platforms"
  homepage "https://packer.io"
  url "https://github.com/hashicorp/packer/archive/refs/tags/v1.12.0.tar.gz"
  sha256 "29555343555a5786568ea7599a98977b6185b43c3efb0f45d09d1c93d559433a"
  license "BUSL-1.1"
  head "https://github.com/hashicorp/packer.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/packer-1.12.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8fbf64c8e97ef3f03859685da54bc8905a1aca2c7404c84c7401ea6f35532a20"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "5cb6a09d40b89761eb5cf3da044d5e588799e7b68e04d4ac4545ec8babe4bca3"
    sha256 cellar: :any_skip_relocation, ventura:       "1f98607e00ab167ff1432f76d3cd6727d17280c29d77f3244e746d328ca59b72"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "7e525ffb8d5b776b5ef126a4214498968f7b42a5806970a28568e3e1b79520c1"
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
    system bin/"packer", "validate", "-syntax-only", minimal
  end
end
