class Wafw00f < Formula
  include Language::Python::Virtualenv

  desc "Web Application Firewall (WAF) fingerprinting tool"
  homepage "https://github.com/EnableSecurity/wafw00f"
  url "https://github.com/EnableSecurity/wafw00f/archive/refs/tags/v2.4.2.tar.gz"
  sha256 "4c8e1247780e2c6f1ebf86c18a2db323a9701edb2355e14f99a2692b29c1c973"
  license "BSD-3-Clause"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/wafw00f-2.4.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "bc5a41c37f13e5b1f4e50bd039d5585a5afb5db91123d2bcca1fbce65ba5a420"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "352f900f292fdac00351f58a53285786fcde2efd346fe5550bdfe41f915e39ee"
  end

  depends_on "python@3.14"

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/e0/2d/a891ca51311197f6ad14a7ef42e2399f36cf2f9bd44752b3dc4eab60fdc5/certifi-2026.1.4.tar.gz"
    sha256 "ac726dd470482006e014ad384921ed6438c457018f4b3d204aea4281258b2120"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/13/69/33ddede1939fdd074bce5434295f38fae7136463422fe4fd3e0e89b98062/charset_normalizer-3.4.4.tar.gz"
    sha256 "94537985111c35f28720e43603b8e7b43a6ecfb2ce1d3058bbe955b73404e21a"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/6f/6d/0703ccc57f3a7233505399edb88de3cbd678da106337b9fcde432b65ed60/idna-3.11.tar.gz"
    sha256 "795dafcc9c04ed0c1fb032c2aa73654d8e8c5023a7df64a53f39190ada629902"
  end

  resource "pysocks" do
    url "https://files.pythonhosted.org/packages/bd/11/293dd436aea955d45fc4e8a35b6ae7270f5b8e00b53cf6c024c83b657a11/PySocks-1.7.1.tar.gz"
    sha256 "3f8804571ebe159c380ac6de37643bb4685970655d3bba243530d6558b799aa0"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/c9/74/b3ff8e6c8446842c3f5c837e9c3dfcfe2018ea6ecef224c710c85ef728f4/requests-2.32.5.tar.gz"
    sha256 "dbba0bac56e100853db0ea71b82b4dfd5fe2bf6d3754a8893c3af500cec7d7cf"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/c7/24/5f1b3bdffd70275f6661c76461e25f024d5a38a46f04aaca912426a2b1d3/urllib3-2.6.3.tar.gz"
    sha256 "1b62b6884944a57dbe321509ab94fd4d3b307075e0c2eae991ac71ee15ad38ed"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/wafw00f --version 2>&1")
  end
end
