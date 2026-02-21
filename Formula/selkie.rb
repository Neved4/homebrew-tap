class Selkie < Formula
  desc "Fast Mermaid diagram parser and renderer written in Rust"
  homepage "https://github.com/btucker/selkie"
  url "https://github.com/btucker/selkie/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "ddcfb83adc8a04856f274a8446093603a8732b139398420a808d60b3c5ae0348"
  license "MIT"
  head "https://github.com/btucker/selkie.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/Neved4/homebrew-tap/releases/download/selkie-0.3.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "c5345e1d79834cf7d5e9d97b76962745c6f46289a8ff1816175a8b847e201ff9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a7cbd914b75ac421218ddedaa8972d7a7862167efe4bdf0497bb999c5ee8e213"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--bin", "selkie", *std_cargo_args
  end

  service do
    run [opt_bin/"selkie", "eval", "--cache-info"]
  end

  test do
    (testpath/"hello.mmd").write <<~EOS
      flowchart TD
          A[Christmas] -->|Get money| B(Go shopping)
          B --> C{Let me think}
          C -->|One| D[Laptop]
          C -->|Two| E[iPhone]
          C -->|Three| F[fa:fa-car Car]
    EOS

    system bin/"selkie", "-i", "hello.mmd", "-o", "hello.svg"
    assert_path_exists testpath/"hello.svg"

    output = (testpath/"hello.svg").read
    assert_match "<svg", output
    assert_match "Christmas", output
  end
end
