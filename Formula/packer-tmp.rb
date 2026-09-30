class PackerTmp < Formula
  desc "Tool for creating identical machine images for multiple platforms"
  homepage "https://github.com/hashicorp/packer"
  url "https://github.com/hashicorp/packer/archive/refs/tags/v1.16.1.tar.gz"
  sha256 "4256f078ac9f5c6b154b2b56ced4be77ef8326387002d30596dd7ac39960142c"
  license "BUSL-1.1"
  head "https://github.com/hashicorp/packer.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/packer-tmp-1.16.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "6465e52751cf6c6aad307be5e8341a0f23cdcd36fff9fa7842cf5420f7f19229"
    sha256 cellar: :any,                 x86_64_linux: "c4fc8de41f8a9ebc72492c0a2634176d03033957b10590515da0e99cd3ec41f1"
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
