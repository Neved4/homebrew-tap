class Hyperspec < Formula
  desc "Common Lisp ANSI-standard Hyperspec"
  homepage "https://www.lispworks.com/documentation/common-lisp.html"
  url "https://ftp.lispworks.com/pub/software_tools/reference/HyperSpec-7-0.tar.gz"
  version "7.0"
  sha256 "1ac1666a9dc697dbd8881262cad4371bcd2e9843108b643e2ea93472ba85d7c3"

  livecheck do
    url :homepage
    regex(/href=.*?HyperSpec[._-]v?(\d+(?:[.-]\d+)+)\.t/i)
    strategy :page_match do |page, regex|
      page.scan(regex).map { |match| match&.first&.tr("-", ".") }
    end
  end

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/hyperspec-7.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0980b6ac1842dd42ef40dc801428cde0fb2eff7b59eeff03716bc57ced3fa56b"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "a31b4fbe3ebb5a669a248fc6fc83194266eaacf7f8c24c563c511a8041f375a6"
    sha256 cellar: :any_skip_relocation, ventura:       "0f8a93185df2ba5bd4c2a7d143129070f1f66de1d80bb8672e896d4ba2a61f2a"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "88cdedec47f26c12d145d785fdd660ae82953bcd23e5ceac68834abd8c703145"
  end

  def install
    doc.install Dir["*"]
  end

  def caveats
    <<~EOS
      To use this copy of the HyperSpec with SLIME, put the following in
      your .emacs initialization file:
      (eval-after-load "slime"
        '(progn
           (setq common-lisp-hyperspec-root
                 "#{HOMEBREW_PREFIX}/share/doc/hyperspec/HyperSpec/")
           (setq common-lisp-hyperspec-symbol-table
                 (concat common-lisp-hyperspec-root "Data/Map_Sym.txt"))
           (setq common-lisp-hyperspec-issuex-table
                 (concat common-lisp-hyperspec-root "Data/Map_IssX.txt"))))
    EOS
  end

  test do
    assert_path_exists doc/"HyperSpec-README.text"
  end
end
