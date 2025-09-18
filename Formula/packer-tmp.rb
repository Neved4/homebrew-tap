class PackerTmp < Formula
  desc "Tool for creating identical machine images for multiple platforms"
  homepage "https://packer.io"
  url "https://github.com/hashicorp/packer/archive/refs/tags/v1.14.2.tar.gz"
  sha256 "ccf971c33149979c9399954ff5742ab236cc7e9665a75955a962f9c9fafcb3d5"
  license "BUSL-1.1"
  head "https://github.com/hashicorp/packer.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/packer-tmp-1.14.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a9c0d991d83539f003d7c8cc9eaa436cf606818d8b371c6ef6e5680317d27ee5"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "9fc628e130047ecbf43cd41f25acada66273e0841725fcfb76439291ec95d2bb"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "390dbfb9a713dce76d75ac5490ebf3545776fdee7a9306b898d788d55e847046"
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
