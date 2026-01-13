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
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "f4bbb7c9439dee6e569ffa263770116fa52c0476af607d842a4209a8d91ccd25"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c861c984feedd6a97c67b66051e2fee6d2edaaeb99fe65bc9516143ba9b1f01a"
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
