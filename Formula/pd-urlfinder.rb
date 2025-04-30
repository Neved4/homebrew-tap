class PdUrlfinder < Formula
  desc "Tool for passively gathering URLs"
  homepage "https://github.com/projectdiscovery/urlfinder"
  url "https://github.com/projectdiscovery/urlfinder/archive/refs/tags/v0.0.3.tar.gz"
  sha256 "cf97cba60ce01d5daa55dd7bb737bf534b63dc5143efd984c6c5f969650a19cb"
  license "MIT"
  head "https://github.com/projectdiscovery/urlfinder.git", branch: "dev"

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
