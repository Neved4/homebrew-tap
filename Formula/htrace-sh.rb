class HtraceSh < Formula
  desc "HTTP/HTTPS troubleshooting and profiling wrapper"
  homepage "https://github.com/trimstray/htrace.sh/"
  url "https://github.com/trimstray/htrace.sh/archive/refs/tags/v1.1.7.tar.gz"
  sha256 "bc8ed23f247d7ae45dd65bdc844c4681215d27016f4b90957493ecbac9e2b743"
  license "GPL-3.0-or-later"
  head "https://github.com/trimstray/htrace.sh.git", branch: "master"

  depends_on "composer"
  depends_on "libmaxminddb"
  depends_on "nghttp2"
  depends_on "nmap"
  depends_on "ssllabs-scan"
  depends_on "subfinder"
  depends_on "testssl"

  def install
    libexec.install Dir["*"]
    (libexec/"bin/htrace.sh").chmod 0555
    (bin/"htrace.sh").write_env_script libexec/"bin/htrace.sh", {}
  end

  test do
    output = shell_output("#{bin}/htrace.sh --version")
    assert_match "htrace.sh v#{version}", output
  end
end
