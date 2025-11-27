class Dnsrecon < Formula
	include Language::Python::Virtualenv

	desc "DNS enumeration and reconnaissance tool"
	homepage "https://github.com/darkoperator/dnsrecon"
	url "https://github.com/darkoperator/dnsrecon/archive/refs/tags/1.5.1.tar.gz"
	sha256 "a8122173dddc040e9dcbd83fa71c332dc35023bf59e960d9da709b2a519fd1c2"
	license "GPL-2.0-only"
	head "https://github.com/darkoperator/dnsrecon.git", branch: "master"

	depends_on "pkg-config" => :build
	depends_on "rust" => :build
	depends_on "libxml2"
	depends_on "libxslt"
	depends_on "libyaml"
	depends_on "python@3.13"

	resource "annotated-doc" do
		url "https://files.pythonhosted.org/packages/" \
				"57/ba/046ceea27344560984e26a590f90bc7f4a75b06701f653222458922b558c/" \
				"annotated_doc-0.0.4.tar.gz"
		sha256 "fbcda96e87e9c92ad167c2e53839e57503ecfda18804ea28102353485033faa4"
	end

	resource "annotated-types" do
		url "https://files.pythonhosted.org/packages/" \
				"ee/67/531ea369ba64dcff5ec9c3402f9f51bf748cec26dde048a2f973a4eea7f5/" \
				"annotated_types-0.7.0.tar.gz"
		sha256 "aff07c09a53a08bc8cfccb9c85b05f1aa9a2a6f23728d790723543408344ce89"
	end

	resource "anyio" do
		url "https://files.pythonhosted.org/packages/" \
				"c6/78/7d432127c41b50bccba979505f272c16cbcadcc33645d5fa3a738110ae75/" \
				"anyio-4.11.0.tar.gz"
		sha256 "82a8d0b81e318cc5ce71a5f1f8b5c4e63619620b63141ef8c995fa0db95a57c4"
	end

	resource "certifi" do
		url "https://files.pythonhosted.org/packages/" \
				"a2/8c/58f469717fa48465e4a50c014a0400602d3c437d7c0c468e17ada824da3a/" \
				"certifi-2025.11.12.tar.gz"
		sha256 "d8ab5478f2ecd78af242878415affce761ca6bc54a22a27e026d7c25357c3316"
	end

	resource "charset-normalizer" do
		url "https://files.pythonhosted.org/packages/" \
				"13/69/33ddede1939fdd074bce5434295f38fae7136463422fe4fd3e0e89b98062/" \
				"charset_normalizer-3.4.4.tar.gz"
		sha256 "94537985111c35f28720e43603b8e7b43a6ecfb2ce1d3058bbe955b73404e21a"
	end

	resource "click" do
		url "https://files.pythonhosted.org/packages/" \
				"3d/fa/656b739db8587d7b5dfa22e22ed02566950fbfbcdc20311993483657a5c0/" \
				"click-8.3.1.tar.gz"
		sha256 "12ff4785d337a1bb490bb7e9c2b1ee5da3112e94a8622f26a6c77f5d2fc6842a"
	end

	resource "deprecated" do
		url "https://files.pythonhosted.org/packages/" \
				"49/85/12f0a49a7c4ffb70572b6c2ef13c90c88fd190debda93b23f026b25f9634/" \
				"deprecated-1.3.1.tar.gz"
		sha256 "b1b50e0ff0c1fddaa5708a2c6b0a6588bb09b892825ab2b214ac9ea9d92a5223"
	end

	resource "dnspython" do
		url "https://files.pythonhosted.org/packages/" \
				"8c/8b/57666417c0f90f08bcafa776861060426765fdb422eb10212086fb811d26/" \
				"dnspython-2.8.0.tar.gz"
		sha256 "181d3c6996452cb1189c4046c61599b84a5a86e099562ffde77d26984ff26d0f"
	end

	resource "fastapi" do
		url "https://files.pythonhosted.org/packages/" \
				"80/f0/086c442c6516195786131b8ca70488c6ef11d2f2e33c9a893576b2b0d3f7/" \
				"fastapi-0.121.3.tar.gz"
		sha256 "0055bc24fe53e56a40e9e0ad1ae2baa81622c406e548e501e717634e2dfbc40b"
	end

	resource "h11" do
		url "https://files.pythonhosted.org/packages/" \
				"01/ee/02a2c011bdab74c6fb3c75474d40b3052059d95df7e73351460c8588d963/" \
				"h11-0.16.0.tar.gz"
		sha256 "4e35b956cf45792e4caa5885e69fba00bdbc6ffafbfa020300e549b208ee5ff1"
	end

	resource "httpcore" do
		url "https://files.pythonhosted.org/packages/" \
				"06/94/82699a10bca87a5556c9c59b5963f2d039dbd239f25bc2a63907a05a14cb/" \
				"httpcore-1.0.9.tar.gz"
		sha256 "6e34463af53fd2ab5d807f399a9b45ea31c3dfa2276f15a2c3f00afff6e176e8"
	end

	resource "httptools" do
		url "https://files.pythonhosted.org/packages/" \
				"b5/46/120a669232c7bdedb9d52d4aeae7e6c7dfe151e99dc70802e2fc7a5e1993/" \
				"httptools-0.7.1.tar.gz"
		sha256 "abd72556974f8e7c74a259655924a717a2365b236c882c3f6f8a45fe94703ac9"
	end

	resource "httpx" do
		url "https://files.pythonhosted.org/packages/" \
				"b1/df/48c586a5fe32a0f01324ee087459e112ebb7224f646c0b5023f5e79e9956/" \
				"httpx-0.28.1.tar.gz"
		sha256 "75e98c5f16b0f35b567856f597f06ff2270a374470a5c2392242528e3e3e42fc"
	end

	resource "idna" do
		url "https://files.pythonhosted.org/packages/" \
				"6f/6d/0703ccc57f3a7233505399edb88de3cbd678da106337b9fcde432b65ed60/" \
				"idna-3.11.tar.gz"
		sha256 "795dafcc9c04ed0c1fb032c2aa73654d8e8c5023a7df64a53f39190ada629902"
	end

	resource "limits" do
		url "https://files.pythonhosted.org/packages/" \
				"bb/e5/c968d43a65128cd54fb685f257aafb90cd5e4e1c67d084a58f0e4cbed557/" \
				"limits-5.6.0.tar.gz"
		sha256 "807fac75755e73912e894fdd61e2838de574c5721876a19f7ab454ae1fffb4b5"
	end

	resource "loguru" do
		url "https://files.pythonhosted.org/packages/" \
				"3a/05/a1dae3dffd1116099471c643b8924f5aa6524411dc6c63fdae648c4f1aca/" \
				"loguru-0.7.3.tar.gz"
		sha256 "19480589e77d47b8d85b2c827ad95d49bf31b0dcde16593892eb51dd18706eb6"
	end

	resource "lxml" do
		url "https://files.pythonhosted.org/packages/" \
				"aa/88/262177de60548e5a2bfc46ad28232c9e9cbde697bd94132aeb80364675cb/" \
				"lxml-6.0.2.tar.gz"
		sha256 "cd79f3367bd74b317dda655dc8fcfa304d9eb6e4fb06b7168c5cf27f96e0cd62"
	end

	resource "netaddr" do
		url "https://files.pythonhosted.org/packages/" \
				"54/90/188b2a69654f27b221fba92fda7217778208532c962509e959a9cee5229d/" \
				"netaddr-1.3.0.tar.gz"
		sha256 "5c3c3d9895b551b763779ba7db7a03487dc1f8e3b385af819af341ae9ef6e48a"
	end

	resource "packaging" do
		url "https://files.pythonhosted.org/packages/" \
				"a1/d4/1fc4078c65507b51b96ca8f8c3ba19e6a61c8253c72794544580a7b6c24d/" \
				"packaging-25.0.tar.gz"
		sha256 "d443872c98d677bf60f6a1f2f8c1cb748e8fe762d2bf9d3148b5599295b0fc4f"
	end

	resource "pydantic" do
		url "https://files.pythonhosted.org/packages/" \
				"96/ad/a17bc283d7d81837c061c49e3eaa27a45991759a1b7eae1031921c6bd924/" \
				"pydantic-2.12.4.tar.gz"
		sha256 "0f8cb9555000a4b5b617f66bfd2566264c4984b27589d3b845685983e8ea85ac"
	end

	resource "pydantic-core" do
		url "https://files.pythonhosted.org/packages/" \
				"71/70/23b021c950c2addd24ec408e9ab05d59b035b39d97cdc1130e1bce647bb6/" \
				"pydantic_core-2.41.5.tar.gz"
		sha256 "08daa51ea16ad373ffd5e7606252cc32f07bc72b28284b6bc9c6df804816476e"
	end

	resource "python-dotenv" do
		url "https://files.pythonhosted.org/packages/" \
				"f0/26/19cadc79a718c5edbec86fd4919a6b6d3f681039a2f6d66d14be94e75fb9/" \
				"python_dotenv-1.2.1.tar.gz"
		sha256 "42667e897e16ab0d66954af0e60a9caa94f0fd4ecf3aaf6d2d260eec1aa36ad6"
	end

	resource "pyyaml" do
		url "https://files.pythonhosted.org/packages/" \
				"05/8e/961c0007c59b8dd7729d542c61a4d537767a59645b82a0b521206e1e25c2/" \
				"pyyaml-6.0.3.tar.gz"
		sha256 "d76623373421df22fb4cf8817020cbb7ef15c725b9d5e45f17e189bfc384190f"
	end

	resource "requests" do
		url "https://files.pythonhosted.org/packages/" \
				"c9/74/b3ff8e6c8446842c3f5c837e9c3dfcfe2018ea6ecef224c710c85ef728f4/" \
				"requests-2.32.5.tar.gz"
		sha256 "dbba0bac56e100853db0ea71b82b4dfd5fe2bf6d3754a8893c3af500cec7d7cf"
	end

	resource "slowapi" do
		url "https://files.pythonhosted.org/packages/" \
				"a0/99/adfc7f94ca024736f061257d39118e1542bade7a52e86415a4c4ae92d8ff/" \
				"slowapi-0.1.9.tar.gz"
		sha256 "639192d0f1ca01b1c6d95bf6c71d794c3a9ee189855337b4821f7f457dddad77"
	end

	resource "sniffio" do
		url "https://files.pythonhosted.org/packages/" \
				"a2/87/a6771e1546d97e7e041b6ae58d80074f81b7d5121207425c964ddf5cfdbd/" \
				"sniffio-1.3.1.tar.gz"
		sha256 "f4324edc670a0f49750a81b895f35c3adb843cca46f0530f79fc1babb23789dc"
	end

	resource "stamina" do
		url "https://files.pythonhosted.org/packages/" \
				"fd/c4/d242d76ffc88aa1fd14214d3143b542857b32276db4a20f8d99669054a5e/" \
				"stamina-25.1.0.tar.gz"
		sha256 "ad674809796ae40512b3b6296cfade826efd63863ff2ca2f59f806342e91e94a"
	end

	resource "starlette" do
		url "https://files.pythonhosted.org/packages/" \
				"ba/b8/73a0e6a6e079a9d9cfa64113d771e421640b6f679a52eeb9b32f72d871a1/" \
				"starlette-0.50.0.tar.gz"
		sha256 "a2a17b22203254bcbc2e1f926d2d55f3f9497f769416b3190768befe598fa3ca"
	end

	resource "tenacity" do
		url "https://files.pythonhosted.org/packages/" \
				"0a/d4/2b0cd0fe285e14b36db076e78c93766ff1d529d70408bd1d2a5a84f1d929/" \
				"tenacity-9.1.2.tar.gz"
		sha256 "1169d376c297e7de388d18b4481760d478b0e99a777cad3a9c86e556f4b697cb"
	end

	resource "typing-extensions" do
		url "https://files.pythonhosted.org/packages/" \
				"72/94/1a15dd82efb362ac84269196e94cf00f187f7ed21c242792a923cdb1c61f/" \
				"typing_extensions-4.15.0.tar.gz"
		sha256 "0cea48d173cc12fa28ecabc3b837ea3cf6f38c6d1136f85cbaaf598984861466"
	end

	resource "typing-inspection" do
		url "https://files.pythonhosted.org/packages/" \
				"55/e3/70399cb7dd41c10ac53367ae42139cf4b1ca5f36bb3dc6c9d33acdb43655/" \
				"typing_inspection-0.4.2.tar.gz"
		sha256 "ba561c48a67c5958007083d386c3295464928b01faa735ab8547c5692e87f464"
	end

	resource "ujson" do
		url "https://files.pythonhosted.org/packages/" \
				"43/d9/3f17e3c5773fb4941c68d9a37a47b1a79c9649d6c56aefbed87cc409d18a/" \
				"ujson-5.11.0.tar.gz"
		sha256 "e204ae6f909f099ba6b6b942131cee359ddda2b6e4ea39c12eb8b991fe2010e0"
	end

	resource "urllib3" do
		url "https://files.pythonhosted.org/packages/" \
				"15/22/9ee70a2574a4f4599c47dd506532914ce044817c7752a79b6a51286319bc/" \
				"urllib3-2.5.0.tar.gz"
		sha256 "3fc47733c7e419d4bc3f6b3dc2b4f890bb743906a30d56ba4a5bfa4bbff92760"
	end

	resource "uvicorn" do
		url "https://files.pythonhosted.org/packages/" \
				"cb/ce/f06b84e2697fef4688ca63bdb2fdf113ca0a3be33f94488f2cadb690b0cf/" \
				"uvicorn-0.38.0.tar.gz"
		sha256 "fd97093bdd120a2609fc0d3afe931d4d4ad688b6e75f0f929fde1bc36fe0e91d"
	end

	resource "uvloop" do
		url "https://files.pythonhosted.org/packages/" \
				"06/f0/18d39dbd1971d6d62c4629cc7fa67f74821b0dc1f5a77af43719de7936a7/" \
				"uvloop-0.22.1.tar.gz"
		sha256 "6c84bae345b9147082b17371e3dd5d42775bddce91f885499017f4607fdaf39f"
	end

	resource "watchfiles" do
		url "https://files.pythonhosted.org/packages/" \
				"c2/c9/8869df9b2a2d6c59d79220a4db37679e74f807c559ffe5265e08b227a210/" \
				"watchfiles-1.1.1.tar.gz"
		sha256 "a173cb5c16c4f40ab19cecf48a534c409f7ea983ab8fed0741304a1c0a31b3f2"
	end

	resource "websockets" do
		url "https://files.pythonhosted.org/packages/" \
				"21/e6/26d09fab466b7ca9c7737474c52be4f76a40301b08362eb2dbc19dcc16c1/" \
				"websockets-15.0.1.tar.gz"
		sha256 "82544de02076bafba038ce055ee6412d68da13ab47f0c60cab827346de828dee"
	end

	resource "wrapt" do
		url "https://files.pythonhosted.org/packages/" \
				"49/2a/6de8a50cb435b7f42c46126cf1a54b2aab81784e74c8595c8e025e8f36d3/" \
				"wrapt-2.0.1.tar.gz"
		sha256 "9c9c635e78497cacb81e84f8b11b23e0aacac7a136e73b8e5b2109a1d9fc468f"
	end

	def install
		virtual_env = virtualenv_create(libexec, "python3.13")
		virtual_env.pip_install resources
		virtual_env.pip_install_and_link buildpath
	end

	test do
		help_output = shell_output("#{bin}/dnsrecon --help")
		assert_includes help_output, "DNSRecon version #{version}"
	end
end
