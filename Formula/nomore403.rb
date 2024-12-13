class Nomore403 < Formula
  desc "Tool to bypass 403/40X response codes"
  homepage "https://github.com/devploit/nomore403"
  url "https://github.com/devploit/nomore403/archive/a47e83b54def7537fe9456e6a327fef1c32939b0.tar.gz"
  version "1.0.2-unstable-001,a47e83b54def7537fe9456e6a327fef1c32939b0"
  sha256 "72e79b75857af47a4685cf50a91aa402a9c82e004b55a0f79fe0cdc6e2fa7a79"
  license "MIT"
  head "https://github.com/devploit/nomore403.git", branch: "main"

  livecheck do
    skip "Current version is broken"
  end

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/nomore403-1.0.2"
    rebuild 2
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "dbd53634bb39915fe6e2ee6e258a3d0128954b3b51f458ee767713b453c0d8b2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "441e81cd9eaff315d4678673a588b78b133d562c65c77c30ab3aed97a45e2565"
    sha256 cellar: :any_skip_relocation, ventura:       "469c44662ba0d53f367ce937b6985d9be5920f3e55bed76cf94b4c56ec9ce4a0"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "ff3ad4084fc1718bd5b5d3a896a3c705456b35b925bb154915de1166616a149a"
  end

  depends_on "go" => [:build, :test]

  def install
    system "go", "build",
      *std_go_args(
        ldflags: "-w -s",
        gcflags: "all=-l -B -wb=false",
      )
    bin.install "payloads"
    doc.install "README.md"
  end

  def caveats
    <<~CAVEATS
      You must provide the path to a payloads folder with -f or --folder. The default payloads
      folder has been installed to #{bin}/payloads. Example:

        $ nomore403 -f #{bin}/payloads -u https://example.com
    CAVEATS
  end

  test do
    (testpath/"403.go").write <<~GO
      package main
      import ("fmt"; "io"; "net/http")
      func status(w http.ResponseWriter, r *http.Request) {
        w.WriteHeader(403)
        io.WriteString(w, "Error 403 Forbidden")
        fmt.Println("User agent:", r.UserAgent())
      }
      func main() {
        http.HandleFunc("/", status)
        http.ListenAndServe(":8000", nil)
      }
    GO

    system "go", "build", "403.go"

    begin
      pid = spawn "#{testpath}/403 > log.txt"
      sleep 1
      desired_output_nomore403 = "162 bytes"
      command = "#{bin}/nomore403 -f #{bin}/payloads -k verbs -u http://localhost:8000"
      assert_includes shell_output(command).strip, desired_output_nomore403

      desired_output_logs = "User agent: nomore403"
      assert_includes shell_output("cat #{testpath}/log.txt").strip, desired_output_logs
    ensure
      Process.kill("SIGTERM", pid)
      Process.wait(pid)
    end
  end
end
