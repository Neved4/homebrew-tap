class CodacyAnalysisCli < Formula
  desc "Codacy static analysis CLI"
  homepage "https://github.com/codacy/codacy-analysis-cli"
  url "https://github.com/codacy/codacy-analysis-cli/releases/download/7.10.1/codacy-analysis-cli-assembly.jar"
  sha256 "a4f3aa089ef1d46c7c2c6741fbff864f8f7a119f3752a4a26ad4af727eeb6ec4"
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
