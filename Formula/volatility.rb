class Volatility < Formula
  include Language::Python::Virtualenv

  desc "Advanced memory forensics framework"
  homepage "https://github.com/volatilityfoundation/volatility3"
  # Update pypi_formula_mappings.json to `{"package_name": "volatility3[full]"}` at version bump
  url "https://files.pythonhosted.org/packages/ac/12/342025bb34b611970e0ca89e2b622e74a29f60995851cf9dab6a473d0505/volatility3-2.28.2.tar.gz"
  sha256 "3c54d44100e4a0f222f2e47e4fb2266669d354a55782844ddbfd3f5d9856706e"
  license :cannot_represent
  version_scheme 1
  head "https://github.com/volatilityfoundation/volatility3.git", branch: "develop"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/volatility-2.28.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "4492d2d32bd8a0332d10d2c552cc35945b06f83bc70d0dbc500b2fed1c072626"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1535d503f76eedde90bf1d1f07a5d63e2b434cf0b37dbdf53d4ebb0960dfbe72"
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
