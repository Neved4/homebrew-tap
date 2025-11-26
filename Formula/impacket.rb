class Impacket < Formula
  include Language::Python::Virtualenv

  desc "Python classes for working with network protocols"
  homepage "https://github.com/fortra/impacket"
  url "https://files.pythonhosted.org/packages/67/7f/" \
      "1058cc156b6a6812b4218383c204b854f36211de18601f78b8d9a1226389/" \
      "impacket-0.13.0.tar.gz"
  sha256 "d09a52befc54db82033360567deb70c48a081813d08a2221b2d1a259cd7e4e3a"
  license "Apache-1.1"
  head "https://github.com/fortra/impacket.git", branch: "master"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/impacket-0.13.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "0caeb5b49596ad4e8f0375cd238fbb5563bfa24966a10f88079e98fe491921f1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e9fb61f6f4986b2d71223433d13208dc8cad8f7b4848539da596cc5ea0f7baaa"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "61e18476b5402dd84f28f83768b8b0ab901c6a631b7cfaaed36f67ce2e10f7b3"
  end

  depends_on "pkg-config" => :build
  depends_on "rust" => :build
  depends_on "cryptography"
  depends_on "openssl@3"
  depends_on "python@3.13"

  resource "blinker" do
    url "https://files.pythonhosted.org/packages/21/28/" \
        "9b3f50ce0e048515135495f198351908d99540d69bfdc8c1d15b73dc55ce/" \
        "blinker-1.9.0.tar.gz"
    sha256 "b4ce2265a7abece45e7cc896e98dbebe6cead56bcf805a3d23136d145f5445bf"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/13/69/" \
        "33ddede1939fdd074bce5434295f38fae7136463422fe4fd3e0e89b98062/" \
        "charset_normalizer-3.4.4.tar.gz"
    sha256 "94537985111c35f28720e43603b8e7b43a6ecfb2ce1d3058bbe955b73404e21a"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/b9/2e/" \
        "0090cbf739cee7d23781ad4b89a9894a41538e4fcf4c31dcdd705b78eb8b/" \
        "click-8.1.8.tar.gz"
    sha256 "ed53c9d8990d83c2a27deae68e4ee337473f6330c040a31d4225c9574d16096a"
  end

  resource "dnspython" do
    url "https://files.pythonhosted.org/packages/b5/4a/" \
        "263763cb2ba3816dd94b08ad3a33d5fdae34ecb856678773cc40a3605829/" \
        "dnspython-2.7.0.tar.gz"
    sha256 "ce9c432eda0dc91cf618a5cedf1a4e142651196bbcd2c80e89ed5a907e5cfaf1"
  end

  resource "flask" do
    url "https://files.pythonhosted.org/packages/dc/6d/" \
        "cfe3c0fcc5e477df242b98bfe186a4c34357b4847e87ecaef04507332dab/" \
        "flask-3.1.2.tar.gz"
    sha256 "bf656c15c80190ed628ad08cdfd3aaa35beb087855e2f494910aa3774cc4fd87"
  end

  resource "itsdangerous" do
    url "https://files.pythonhosted.org/packages/9c/cb/" \
        "8ac0172223afbccb63986cc25049b154ecfb5e85932587206f42317be31d/" \
        "itsdangerous-2.2.0.tar.gz"
    sha256 "e0050c0b7da1eea53ffaf149c0cfbb5c6e2e2b69c4bef22c81fa6eb73e5f6173"
  end

  resource "jinja2" do
    url "https://files.pythonhosted.org/packages/af/92/" \
        "b3130cbbf5591acf9ade8708c365f3238046ac7cb8ccba6e81abccb0ccff/" \
        "jinja2-3.1.5.tar.gz"
    sha256 "8fefff8dc3034e27bb80d67c671eb8a9bc424c0ef4c0826edbff304cceff43bb"
  end

  resource "ldap3" do
    url "https://files.pythonhosted.org/packages/43/ac/" \
        "96bd5464e3edbc61595d0d69989f5d9969ae411866427b2500a8e5b812c0/" \
        "ldap3-2.9.1.tar.gz"
    sha256 "f3e7fc4718e3f09dda568b57100095e0ce58633bcabbed8667ce3f8fbaa4229f"
  end

  resource "ldapdomaindump" do
    url "https://files.pythonhosted.org/packages/14/48/" \
        "2757e0453f828e33f7b41e5489976fbe7d504d513e07da53eb904030a288/" \
        "ldapdomaindump-0.10.0.tar.gz"
    sha256 "cbc66b32a7787473ffd169c5319acde46c02fdc9d444556e6448e0def91d3299"
  end

  resource "markupsafe" do
    url "https://files.pythonhosted.org/packages/b2/97/" \
        "5d42485e71dfc078108a86d6de8fa46db44a1a9295e89c5d6d4a06e23a62/" \
        "markupsafe-3.0.2.tar.gz"
    sha256 "ee55d3edf80167e48ea11a923c7386f4669df67d7994554387f84e7d8b0a2bf0"
  end

  resource "pyasn1" do
    url "https://files.pythonhosted.org/packages/ba/e9/" \
        "01f1a64245b89f039897cb0130016d79f77d52669aae6ee7b159a6c4c018/" \
        "pyasn1-0.6.1.tar.gz"
    sha256 "6f580d2bdd84365380830acf45550f2511469f673cb4a5ae3857a3170128b034"
  end

  resource "pyasn1-modules" do
    url "https://files.pythonhosted.org/packages/e9/e6/" \
        "78ebbb10a8c8e4b61a59249394a4a594c1a7af95593dc933a349c8d00964/" \
        "pyasn1_modules-0.4.2.tar.gz"
    sha256 "677091de870a80aae844b1ca6134f54652fa2c8c5a52aa396440ac3106e941e6"
  end

  resource "pycryptodomex" do
    url "https://files.pythonhosted.org/packages/c9/85/" \
        "e24bf90972a30b0fcd16c73009add1d7d7cd9140c2498a68252028899e41/" \
        "pycryptodomex-3.23.0.tar.gz"
    sha256 "71909758f010c82bc99b0abf4ea12012c98962fbf0583c2164f8b84533c2e4da"
  end

  resource "pyopenssl" do
    url "https://files.pythonhosted.org/packages/80/be/" \
        "97b83a464498a79103036bc74d1038df4a7ef0e402cfaf4d5e113fb14759/" \
        "pyopenssl-25.3.0.tar.gz"
    sha256 "c981cb0a3fd84e8602d7afc209522773b94c1c2446a3c710a75b06fe1beae329"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/94/e7/" \
        "b2c673351809dca68a0e064b6af791aa332cf192da575fd474ed7d6f16a2/" \
        "six-1.17.0.tar.gz"
    sha256 "ff70335d468e7eb6ec65b95b99d3a2836546063f63acc5171de367e834932a81"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/df/db/" \
        "f35a00659bc03fec321ba8bce9420de607a1d37f8342eee1863174c69557/" \
        "typing_extensions-4.12.2.tar.gz"
    sha256 "1a7ead55c7e559dd4dee8856e3a88b41225abfe1ce8df57b7c13915fe121ffb8"
  end

  resource "werkzeug" do
    url "https://files.pythonhosted.org/packages/9f/69/" \
        "83029f1f6300c5fb2471d621ab06f6ec6b3324685a2ce0f9777fd4a8b71e/" \
        "werkzeug-3.1.3.tar.gz"
    sha256 "60723ce945c19328679790e3282cc758aa4a6040e4bb330f53d30fa546d44746"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_includes shell_output("#{bin}/mqtt_check.py --help 2>&1"),
      "Impacket v#{version}"
  end
end
