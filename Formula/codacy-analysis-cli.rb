class CodacyAnalysisCli < Formula
  desc "Codacy static analysis CLI"
  homepage "https://github.com/codacy/codacy-analysis-cli"
  url "https://github.com/codacy/codacy-analysis-cli/releases/download/7.10.5/codacy-analysis-cli-assembly.jar"
  sha256 "03a4c6157c9d475d460ed79fc84ccea452ca4a6e2ce32969baca4bf3b09baf68"
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
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/codacy-analysis-cli-7.10.5"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "9e8fc82915188e177bd744a6b6126861118d5293c8564bd5be9deac1842a75e6"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f16455ef24de84b4a85bbadd6b0f1cc5d32c51e3ad2f5a7effff78c02ad2cf58"
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
