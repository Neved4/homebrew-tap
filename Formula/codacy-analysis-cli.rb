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
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/codacy-analysis-cli-7.10.3"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "6f197e421489d11ff80b5b01f9d3599f907ad76e550894b5da9dcc6c1ebc57d2"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "24eff64ff9067e69827ab27e04b67ab630dc2083e867e7674cfd62bf41835fb1"
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
