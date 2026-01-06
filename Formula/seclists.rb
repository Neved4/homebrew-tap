class Seclists < Formula
  desc "Collection of multiple security wordlists"
  homepage "https://github.com/danielmiessler/SecLists"
  url "https://gitlab.com/kalilinux/packages/seclists/-/archive/upstream/2025.3/seclists-upstream-2025.3.tar.gz"
  sha256 "fa2c4abff3e1b039a10778ddde43e7bae06710310e3709cc45c9eedc98b377e8"
  license "MIT"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/seclists-2025.3"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "1cf0bd513b40004f1a62c210bd8129a349893da87284b53c45eca5609b1b2bcb"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "2fd6fa69942fb3d67ba74abd68e155921a889be1725be02a3d04296366303132"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "6d5afd457a1b2b01a6d89f5589b5a13b94f6d65dc40e44c47aa2e1077a1d7814"
  end

  def install
    pkgshare.install Dir["*"]
  end

  test do
    assert_path_exists pkgshare/"README.md"
  end
end
