class Volatility < Formula
  include Language::Python::Virtualenv

  desc "Advanced memory forensics framework"
  homepage "https://github.com/volatilityfoundation/volatility3"
  # Update pypi_formula_mappings.json to `{"package_name": "volatility3[full]"}` at version bump
  url "https://files.pythonhosted.org/packages/fc/06/9cd38374013d33f2594bb7a36e53f09b7ff1c40b83cb657ce35dc464b314/volatility3-2.26.0.tar.gz"
  sha256 "2972875992a3ae586898f0c833837a37241be44c8e1d986c6b911efc1786330a"
  license :cannot_represent
  version_scheme 1
  head "https://github.com/volatilityfoundation/volatility3.git", branch: "develop"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/volatility-2.11.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "fa05ee6c5dc019d7bc95cf8dc109e0c295d77c5629cc10d030c8994adf7108a9"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "134e9e2b65ae70e7b03626c08b09d9ea5a8e03a0faa3d4448d938b642ae3c6c0"
    sha256 cellar: :any_skip_relocation, ventura:       "ae8939bfb89ebbbd7d00e12b04c6c0be78b4c4e6ed4cc4e73b8676de58987d3f"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "2c17a123c5c0759a8aacf20e18540fdcc76b7c438f51320a98eb2f4e1999e708"
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
