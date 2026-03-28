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
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/codacy-analysis-cli-7.10.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "9e2f4dd52e4630c360ca42f0162158ff7e96d82c62504efcf4859d04b80c25d5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9621cc79abb1151c387ae9c90cb87f1026b8708953ea6f32be856f6125910e34"
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
