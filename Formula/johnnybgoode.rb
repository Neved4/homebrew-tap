class Johnnybgoode < Formula
  desc "Assistant for users of the Johnny Decimal file organization system"
  homepage "https://github.com/SwissArmyWrench/johnnybgoode"
  url "https://github.com/SwissArmyWrench/johnnybgoode/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "049ced703b78656e40ada435934109cc8e4b6fc4be994e8bfff6c313ea762aa8"
  license "MIT"
  head "https://github.com/SwissArmyWrench/johnnybgoode.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/johnnybgoode-1.2.0"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "73664c4494fcb51a01d1bb580bd37a15c78331eb714228af243246a4b869442d"
    sha256 cellar: :any,                 x86_64_linux: "fcb169e2761d17618e20eacd8b4aa4b5c1e1456e33ce6e32183137ae4b090c71"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    (testpath/"johnny-home").mkpath
    (testpath/"config.yaml").write <<~YAML
      johnnydecimal_home: #{testpath}/johnny-home
      name_scheme: default
      regex:
    YAML

    output = shell_output(
      "JOHNNYBGOODE_CONFIG_PATH=#{testpath}/config.yaml #{bin}/johnnybgoode invalid 2>&1",
    )
    assert_match 'johnnybgoode: "invalid" is not a recognized command', output
  end
end
