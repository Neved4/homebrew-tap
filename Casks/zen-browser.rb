class Zenbrowser < Formula
  desc "Zen web browser"
  homepage "https://github.com/zen-browser/desktop"
  url "https://github.com/zen-browser/desktop/releases/download/1.0.0-a.28/zen.macos-aarch64.dmg"
  version "1.0.0-a.28"
  sha256 ""
  license "MPL-2.0"
  head "https://github.com/zen-browser/desktop.git", branch: "main"

  auto_updates true
  app "Zen Browser.app"
  depends_on macos: ">= :catalina"
end
