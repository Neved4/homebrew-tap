class Dnsenum2 < Formula
  desc "Multithreaded Perl DNS enumeration script"
  homepage "https://github.com/SparrowOchon/dnsenum2"
  url "https://github.com/SparrowOchon/dnsenum2/archive/" \
      "17d3d04137636515150f54a8234d573d8205f0ec.tar.gz"
  version "1.3.2"
  sha256 "c9f6155b98d9f7423c5ce9e979350fa187c2871aa7c37f6d4f52c81c6a75e0a6"
  license "GPL-2.0-or-later"
  head "https://github.com/SparrowOchon/dnsenum2.git", branch: "master"

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/dnsenum2-1.3.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "f069904d10bf2b05b3229b3f4fe4d882da9f88fde19312294227a9748de072e0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a4ed95766a5fb6fa22647431ef8e216ae272f17cf5166dbb7da3a7df8a9cdcb9"
  end

  depends_on "perl"

  resource "Net-IP" do
    url "https://cpan.metacpan.org/authors/id/M/MA/MANU/" \
        "Net-IP-1.26.tar.gz"
    sha256 "040f16f3066647d761b724a3b70754d28cbd1e6fe5ea01c63ed1cd857117d639"
  end

  resource "Net-DNS" do
    url "https://cpan.metacpan.org/authors/id/N/NL/NLNETLABS/" \
        "Net-DNS-1.53.tar.gz"
    sha256 "04acb4f177d57c147dcedc4bd70e23806af3db75a532f46f95461b2bc9a94959"
  end

  resource "Net-Netmask" do
    url "https://cpan.metacpan.org/authors/id/J/JM/JMASLAK/" \
        "Net-Netmask-2.0003.tar.gz"
    sha256 "74a2021259cb6cf7bbb9f4caa2677dca820fd93c8f1322336f48a48793155bdc"
  end

  resource "XML-Writer" do
    url "https://cpan.metacpan.org/authors/id/J/JO/JOSEPHW/" \
        "XML-Writer-0.900.tar.gz"
    sha256 "73c8f5bd3ecf2b350f4adae6d6676d52e08ecc2d7df4a9f089fa68360d400d1f"
  end

  resource "Module-Build" do
    url "https://cpan.metacpan.org/authors/id/L/LE/LEONT/" \
        "Module-Build-0.4234.tar.gz"
    sha256 "66aeac6127418be5e471ead3744648c766bd01482825c5b66652675f2bc86a8f"
  end

  resource "String-Random" do
    url "https://cpan.metacpan.org/authors/id/S/SH/SHLOMIF/" \
        "String-Random-0.32.tar.gz"
    sha256 "9d93c679a34ffa26d3b4fa0837caed1cd2e67d76572818b91e97dea734705246"
  end

  resource "Net-Whois-IP" do
    url "https://cpan.metacpan.org/authors/id/B/BS/BSCHMITZ/" \
        "Net-Whois-IP-1.19.tar.gz"
    sha256 "f09bdfa0f1d2665b534826b5f3a8662349930eed2998efe4d8dbf98813147222"
  end

  resource "HTML-Parser" do
    url "https://cpan.metacpan.org/authors/id/O/OA/OALDERS/" \
        "HTML-Parser-3.83.tar.gz"
    sha256 "7278ce9791256132b26a71a5719451844704bb9674b58302c3486df43584f8c0"
  end

  resource "WWW-Mechanize" do
    url "https://cpan.metacpan.org/authors/id/O/OA/OALDERS/" \
        "WWW-Mechanize-2.20.tar.gz"
    sha256 "5adce695f3968565d3c8e597b988525ee4c89f40ecb1a21ecee7a16532dbb668"
  end

  def install
    perl = Formula["perl"].opt_bin/"perl"

    ENV.prepend_create_path "PERL5LIB", libexec/"lib/perl5"
    ENV["PERL_MM_USE_DEFAULT"] = "1"

    resource("Module-Build").stage do
      system perl, "Build.PL", "--install_base", libexec
      system "./Build", "install"
    end

    resources.each do |resource_item|
      next if resource_item.name == "Module-Build"

      resource_item.stage do
        if File.exist?("Makefile.PL")
          system perl, "Makefile.PL",
            "INSTALL_BASE=#{libexec}"
          system "make", "install"
        else
          system perl, "Build.PL", "--install_base", libexec
          system "./Build", "install"
        end
      end
    end

    inreplace "dnsenum.pl",
      "/usr/share/dnsenum/dns.txt",
      "#{HOMEBREW_PREFIX}/share/dnsenum/dns.txt"

    system "make"

    (libexec/"bin").install "dnsenum.pl" => "dnsenum"
    chmod 0755, libexec/"bin/dnsenum"
    (bin/"dnsenum").write_env_script libexec/"bin/dnsenum",
      PERL5LIB: ENV["PERL5LIB"]

    man1.install "dnsenum.1"
    (share/"dnsenum").install "dns.txt"
  end

  test do
    output = shell_output("#{bin}/dnsenum --help 2>&1", 1)
    assert_match "VERSION:#{version}", output
  end
end
