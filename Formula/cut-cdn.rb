class CutCdn < Formula
  desc "Remove CDN IPs from the list of IP addresses"
  homepage "https://github.com/ImAyrix/cut-cdn"
  url "https://github.com/ImAyrix/cut-cdn/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "0dbb3aaca5b4850e729f6ad916ff7297c41acfe4604e07f0d601b0db30573fa7"
  license "MIT"
  head "https://github.com/ImAyrix/cut-cdn.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build",
           *std_go_args(output: bin/"cut-cdn", ldflags: "-s -w")
  end

  test do
    output = shell_output("#{bin}/cut-cdn -version 2>&1")
    assert_match "Current Version: v#{version}", output
  end
end
