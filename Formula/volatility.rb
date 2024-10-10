class Volatility < Formula
  include Language::Python::Virtualenv

  desc "Advanced memory forensics framework"
  homepage "https://github.com/volatilityfoundation/volatility3"
  # Update pypi_formula_mappings.json to `{"package_name": "volatility3[full]"}` at version bump
  url "https://files.pythonhosted.org/packages/13/19/354d50bfe325d7a4e805f7e08f68b1b21a47efa0e23e454caea9a9a976de/volatility3-2.8.0.tar.gz"
  sha256 "25a8997dad06970544da53f5cc8404e6a951b8d55be183615200a59e7b6a105c"
  license :cannot_represent
  version_scheme 1
  head "https://github.com/volatilityfoundation/volatility3.git", branch: "develop"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/volatility-2.7.0"
    sha256 cellar: :any,                 arm64_sonoma: "d1724d7dfb88c2aa48aad50626b18f4e99f8d1ea4c33e3c1fc7991525bf747ca"
    sha256 cellar: :any,                 ventura:      "c3db305745e4b59887f22b6796c091235b159b0bb479effee5a03209dd4f1c7c"
    sha256 cellar: :any,                 monterey:     "374218c29fdb41002e676aa8b80d63b0c8f0af8eed3a0af8b47ce1691079e92a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "197af9d14be25c1cb673cca147da5b6d392815930cfade845668730c535767ea"
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
    system bin/"vol", "--help"
  end
end
