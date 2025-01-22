class Comrak < Formula
  desc "CommonMark + GFM compatible Markdown parser and renderer"
  homepage "https://github.com/kivikakk/comrak"
  url "https://github.com/kivikakk/comrak/archive/refs/tags/v0.34.0.tar.gz"
  sha256 "9713d6fc896c84091de5b56e374451cff8693f38a222d0bde35f0ab0cfb63e55"
  license "BSD-2-Clause"
  head "https://github.com/kivikakk/comrak.git", branch: "main"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/comrak-0.34.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "9374273b9f470102b1c3278696512bd78635e0af155ad1fcfc5fa7fbb876a714"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "db600e1fc06cc7eda0967122e26542a05f5362166d2413d8aea615c44b4f552f"
    sha256 cellar: :any_skip_relocation, ventura:       "4a61d1e29d55cfc5b62fc2bfc1157fcffed020c32a13f771a3b2e2389cc19e34"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "5e94681894c6a559e0cc16801d642452654cc021c478c22318ae361e4202f4bb"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    desired_output = "<p>This <em>is</em> a <strong>test</strong>.</p>"
    command = "echo 'This *is* a **test**.' | #{bin}/comrak"
    assert_equal desired_output, shell_output(command).strip
  end
end
