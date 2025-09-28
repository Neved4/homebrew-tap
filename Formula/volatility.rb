class Volatility < Formula
  include Language::Python::Virtualenv

  desc "Advanced memory forensics framework"
  homepage "https://github.com/volatilityfoundation/volatility3"
  # Update pypi_formula_mappings.json to `{"package_name": "volatility3[full]"}` at version bump
  url "https://files.pythonhosted.org/packages/f6/70/3caa032a703f316bfee43dcc146a1d5b6a281d2c10da5749e361f6d15f5c/volatility3-2.26.2.tar.gz"
  sha256 "6c33e3a95ce3c85f2dc996d818ad84cdfb96ac1b13dd29b5049585e76b5703ee"
  license :cannot_represent
  version_scheme 1
  head "https://github.com/volatilityfoundation/volatility3.git", branch: "develop"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/volatility-2.26.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "27dd34fe0036f6e55343c555a6a231fb79fbe18da81a8f20c6b5a2ee1f49f53a"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "9dffd1ecc51759de610ca7245ce979aefb0c68463a7efd7da66c0d2999e53e84"
    sha256 cellar: :any_skip_relocation, ventura:       "ef171fbcbbb253bbfd3d0a6166550d647be349843db1e568d6fe8ea69806f6f5"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "febabc91542c8d073119a24b1696ae20c983450d8fb20e3b5f73be37cc2eab38"
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
    desired_output = "Volatility 3 Framework #{version}"
    assert_includes shell_output("#{bin}/vol --help").strip, desired_output
  end
end
