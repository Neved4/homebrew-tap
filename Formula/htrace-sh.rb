class HtraceSh < Formula
  desc "HTTP/HTTPS troubleshooting and profiling wrapper"
  homepage "https://github.com/trimstray/htrace.sh/"
  url "https://github.com/trimstray/htrace.sh/archive/refs/tags/v1.1.7.tar.gz"
  sha256 "bc8ed23f247d7ae45dd65bdc844c4681215d27016f4b90957493ecbac9e2b743"
  license "GPL-3.0-or-later"
  head "https://github.com/trimstray/htrace.sh.git", branch: "master"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/htrace-sh-1.1.7"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "256153c61109401e5036897c4bed7546440c05be3babf6781b08e7ea73089904"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "41c502d0d268cf878d1d28b96fddcb85ac0afa7d7f146589e82d7101a8d8a866"
  end

  depends_on "composer"
  depends_on "coreutils"
  depends_on "gnu-getopt"
  depends_on "gnu-sed"
  depends_on "libmaxminddb"
  depends_on "mixed-content-scan"
  depends_on "nghttp2"
  depends_on "nmap"
  depends_on "observatory"
  depends_on "ssllabs-scan"
  depends_on "subfinder"
  depends_on "testssl"
  depends_on "wafw00f"

  def install
    libexec.install Dir["*"]
    (libexec/"bin/htrace.sh").chmod 0555
    env = {
      PATH: "#{Formula["gnu-getopt"].opt_bin}:#{Formula["gnu-sed"].libexec}/gnubin:" \
            "#{Formula["coreutils"].libexec}/gnubin:$PATH",
    }
    (bin/"htrace.sh").write_env_script libexec/"bin/htrace.sh", env
  end

  test do
    assert_path_exists bin/"htrace.sh"

    # TODO: fix, doesn't work
    # output = shell_output("#{bin}/htrace.sh --version").chomp
    # assert_match "htrace.sh, v#{version}", output
  end
end
