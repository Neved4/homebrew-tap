class PdUrlfinder < Formula
  desc "Tool for passively gathering URLs"
  homepage "https://github.com/projectdiscovery/urlfinder"
  url "https://github.com/projectdiscovery/urlfinder/archive/refs/tags/v0.0.3.tar.gz"
  sha256 "cf97cba60ce01d5daa55dd7bb737bf534b63dc5143efd984c6c5f969650a19cb"
  license "MIT"
  head "https://github.com/projectdiscovery/urlfinder.git", branch: "dev"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/pd-urlfinder-0.0.3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "23cb35d4e5e9264dbbd1aae81306ee401e87d8c568821832bb71e1b07347c764"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "bc7f7da96cb7a989eb10c53576b44b3965385f34204b1722501fbda675ad30e7"
    sha256 cellar: :any_skip_relocation, ventura:       "4f57988e5dc95fde721746e293c7ccee7afa4dd6aa6aedb6cb5f70dc4aa7d747"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "5888680f018c7fcec3134f99d30671b36ec32c61065c754479b4fa8a9c1dfda9"
  end

  depends_on "go" => :build

  def install
    system "go", "build",
      *std_go_args(
        ldflags: "-w -s",
        gcflags: "all=-l -B -wb=false",
      ),
    "cmd/urlfinder/main.go"
  end

  test do
    desired_output = "Current Version: v#{version}"

    # very hacky workaround for https://github.com/projectdiscovery/urlfinder/issues/113
    10.times do |i|
      output = pipe_output("#{bin}/pd-urlfinder --version 2>&1").strip
      ohai "Attempt #{i}"
      if output.include?(desired_output)
        assert_includes output, desired_output
        break
      end
    end
  end
end
