class PackerTmp < Formula
  desc "Tool for creating identical machine images for multiple platforms"
  homepage "https://developer.hashicorp.com/packer"
  url "https://github.com/hashicorp/packer/archive/refs/tags/v1.15.0.tar.gz"
  sha256 "44e0d4a9e8018eeef01ce5568236861d4a07a9ff9e42ac30d2d1ce1835700acf"
  license "BUSL-1.1"
  head "https://github.com/hashicorp/packer.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/packer-tmp-1.14.3"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "0da1878c39654a59b907c038928a6ac87fc204dae46239783537ae901572cc68"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "01b1f2ae17c85724e3f603bf9d2e0b96f1153939f77d699a16e90a56b2961600"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "65e31298ab95b1bb787ba65824b7ca7c48e0db9d6ce734ba09d4df9b3e08445e"
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
