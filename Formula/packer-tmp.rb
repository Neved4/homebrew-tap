class PackerTmp < Formula
  desc "Tool for creating identical machine images for multiple platforms"
  homepage "https://github.com/hashicorp/packer"
  url "https://github.com/hashicorp/packer/archive/refs/tags/v1.15.3.tar.gz"
  sha256 "69db1a7cb08b4766b0a397d864e23d0fbad348e26c82eabac6d6bdd9fb9d5bf5"
  license "BUSL-1.1"
  head "https://github.com/hashicorp/packer.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/packer-tmp-1.15.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "9f58c6ea9db60fd5a531a741839f31cf6452b5b9bc5571060a4957b11d8e6e84"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9aa1a863b34d59f3acc9174fa8a4e6a5530e6df3cd7f945d2f21df7081aa265e"
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
