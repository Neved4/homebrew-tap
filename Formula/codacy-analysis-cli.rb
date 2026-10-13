class CodacyAnalysisCli < Formula
  desc "Codacy static analysis CLI"
  homepage "https://github.com/codacy/codacy-analysis-cli"
  url "https://github.com/codacy/codacy-analysis-cli/releases/download/7.10.3/codacy-analysis-cli-assembly.jar"
  sha256 "6b7bc83d8d1adc2b7269a83bb1cb7a2a8f447e13f5836e46ba62478a78870cf4"
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
