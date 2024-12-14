class Nomore403 < Formula
  desc "Tool to bypass 403/40X response codes"
  homepage "https://github.com/devploit/nomore403"
  url "https://github.com/devploit/nomore403/archive/a47e83b54def7537fe9456e6a327fef1c32939b0.tar.gz"
  version "1.0.2-unstable-001_a47e83b54def7537fe9456e6a327fef1c32939b0"
  sha256 "72e79b75857af47a4685cf50a91aa402a9c82e004b55a0f79fe0cdc6e2fa7a79"
  license "MIT"
  head "https://github.com/devploit/nomore403.git", branch: "main"

  livecheck do
    skip "Current version is broken"
  end

  depends_on "go" => [:build, :test]

  def install
    system "go", "build",
      *std_go_args(
        ldflags: "-w -s",
        gcflags: "all=-l -B -wb=false",
      )
    libexec.install "payloads"
    doc.install "README.md"
  end

  def caveats
    <<~CAVEATS
      You must provide the path to a payloads folder with -f or --folder. The default payloads
      folder has been installed to #{libexec}/payloads. Example:

        $ nomore403 -f #{libexec}/payloads -u https://example.com
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
      command = "#{bin}/nomore403 -f #{libexec}/payloads -k verbs -u http://localhost:8000"
      assert_includes shell_output(command).strip, desired_output_nomore403

      desired_output_logs = "User agent: nomore403"
      assert_includes shell_output("cat #{testpath}/log.txt").strip, desired_output_logs
    ensure
      Process.kill("SIGTERM", pid)
      Process.wait(pid)
    end
  end
end
