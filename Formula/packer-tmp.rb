class PackerTmp < Formula
  desc "Tool for creating identical machine images for multiple platforms"
  homepage "https://github.com/hashicorp/packer"
  url "https://github.com/hashicorp/packer/archive/refs/tags/v1.16.0.tar.gz"
  sha256 "9527aa4ba6a621b67c767803e5ba12b560263ae11b5e25d3db4623a7ec70d6d4"
  license "BUSL-1.1"
  head "https://github.com/hashicorp/packer.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/packer-tmp-1.16.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "87bfe218af984bb9a4592bd10f9365d68a68cdde4bd06b30a128f487c212c173"
    sha256 cellar: :any,                 x86_64_linux: "32fc86b434523814ef4dd3b64c7b0184ad5a54f59ca2d7fc90e7ae4d071eebbb"
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
