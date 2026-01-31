class Volatility < Formula
  include Language::Python::Virtualenv

  desc "Advanced memory forensics framework"
  homepage "https://github.com/volatilityfoundation/volatility3"
  # Update pypi_formula_mappings.json to `{"package_name": "volatility3[full]"}` at version bump
  url "https://files.pythonhosted.org/packages/52/94/b5de76a198a0b0b8af49fc6d8da3ddc15a0a791b9ddf09d06045d6a508d9/volatility3-2.27.0.tar.gz"
  sha256 "12a3fd4c841fadccb6b0bd96e40a99390ca09518e34de0addcbd9ff841a9bc58"
  license :cannot_represent
  version_scheme 1
  head "https://github.com/volatilityfoundation/volatility3.git", branch: "develop"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/volatility-2.26.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "7dbc813051996692b9828f4bcc5e0950621655381ea85caf021fceb9f00395b5"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "6e73d53ab2b1087267206944b8be44f993b02621dcdf652c265df6e85ac15bd8"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "7a87e1d3da816f89b6dd5330531c45938eefe4536ca7e393cc76869da8a2a1e8"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "bd97381ada5ac16a7eb8ed21864da0db363486291f8ea28b8fec3d8ee78e81f8"
  end

  depends_on "rust" => :build # for rpds-py
  depends_on "openssl@3"
  depends_on "python@3.12"
  depends_on "yara"

  resource "pefile" do
    url "https://files.pythonhosted.org/packages/03/4f/2750f7f6f025a1507cd3b7218691671eecfd0bbebebe8b39aa0fe1d360b8/pefile-2024.8.26.tar.gz"
    sha256 "3ff6c5d8b43e8c37bb6e6dd5085658d658a7a0bdcd20b6a07b1fcfc1c4e9d632"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    desired_output = "usage: vol"
    assert_includes shell_output("#{bin}/vol --help").strip, desired_output
  end
end
