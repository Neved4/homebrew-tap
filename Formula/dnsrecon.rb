class Dnsrecon < Formula
	desc "DNS reconnaissance CLI written in Go"
	homepage "https://github.com/Neved4/dnsrecon"
	url "https://github.com/Neved4/dnsrecon/archive/" \
			"ce3221067a23159c0b341467d087f8345261ea24.tar.gz"
	sha256 "f1ea9b23322fd1802db1087355880ad9f2d1205b945011bfbbb18ce790204225"
	license "MIT"
	head "https://github.com/Neved4/dnsrecon.git", branch: "main"

	depends_on "go" => :build

	def install
		ldFlags = %w[
			-s -w
		]

		system "go", "build", *std_go_args(
			output:   libexec/"bin/dnspeek",
			ldflags:  ldFlags,
			trimpath: true,
		), "./cmd/dnspeek"

		pkgshare.install Dir["data/*"]
		man1.install "doc/main/dnspeek" => "dnspeek.1"

		(bin/"dnspeek").write_env_script libexec/"bin/dnspeek",
			DNSPEEK_DATA: pkgshare
	end

	test do
		helpOutput = shell_output("#{bin}/dnspeek --help")
		assert_includes helpOutput, "dnspeek - a cozy Go rewrite of dnsrecon"
	end
end
