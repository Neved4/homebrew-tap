class CodacyAnalysisCli < Formula
  desc "Codacy static analysis CLI"
  homepage "https://github.com/codacy/codacy-analysis-cli"
  url "https://github.com/codacy/codacy-analysis-cli/releases/download/7.10.0/codacy-analysis-cli-assembly.jar"
  sha256 "9e611fedfb47eda0b2b980c102cd5bd067fea824a4ac1a8d1d0d8c17d79017fc"
  license "AGPL-3.0-only"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
    strategy :git do |tags, regex|
      tags.filter_map do |tag|
        next if /^v?2\.0\.0$/.match?(tag)

        tag[regex, 1]
      end
    end
  end

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/codacy-analysis-cli-7.10.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "28e762e81b74e0845cc2e438b8e2cba1f2c0e3689593c8d13c5f37c523f70d7d"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ace8042344c84a79415ebd49749adeade5b842583b303aff060c26e48752bc4f"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "ee06178e07e71dc60395cdd2970d299c404e26909883266d31de2a0fea2ed0c0"
  end

  depends_on "openjdk"

  def install
    libexec.install "codacy-analysis-cli-assembly.jar"
    bin.write_jar_script libexec/"codacy-analysis-cli-assembly.jar", "codacy-analysis-cli"
  end

  test do
    assert_match "Codacy", shell_output("#{bin}/codacy-analysis-cli --help 2>&1")
  end
end
