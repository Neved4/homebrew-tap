class PackerTmp < Formula
  desc "Tool for creating identical machine images for multiple platforms"
  homepage "https://packer.io"
  url "https://github.com/hashicorp/packer/archive/refs/tags/v1.14.1.tar.gz"
  sha256 "1ca864b4f2aa34294257f83a37b1d56b0e9ba5b64d76f53283e1b6892c304dbf"
  license "BUSL-1.1"
  head "https://github.com/hashicorp/packer.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/packer-tmp-1.14.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "21fcf8fe1c0cbf1757dfb5fed20b1942181151c517c9953bee5fce64980b28d4"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "3c65d8ab1eea903a9a9601e54c2236e50aff92c98af9490bb92a687b429818af"
    sha256 cellar: :any_skip_relocation, ventura:       "c5b787a2a83aeec62801064e7080dd7c48414992507f6b5725665437fd3c2372"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "e71b8c422827874c74bd5e9b1bb9c2f5cd753a1fc141fb539f7d2180c733230f"
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
