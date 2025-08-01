class PackerTmp < Formula
  desc "Tool for creating identical machine images for multiple platforms"
  homepage "https://packer.io"
  url "https://github.com/hashicorp/packer/archive/refs/tags/v1.14.0.tar.gz"
  sha256 "7eabd95c82ff903be15d58d79e1f606e7c4b247f4859954854acb11d103c21d4"
  license "BUSL-1.1"
  head "https://github.com/hashicorp/packer.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/packer-tmp-1.13.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "6657adc384be3576bb585e825cbe2ab6595fd5882d73baef5afe2d1092db3dff"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "0929128c7a11ae99d2628ac761166f7c02b4143cab910bc8aa4abc4a9dfc8b41"
    sha256 cellar: :any_skip_relocation, ventura:       "a02202346e0e873535a7b3513937920259bcd8659ef39e19c99e85c5d6285583"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "6c047d69ca671a21222cee9cb74539b2d4daac491cad40ac78a6c4e72ca6a1e9"
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
