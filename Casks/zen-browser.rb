cask "zen-browser" do
  arch arm: "aarch64", intel: "x64"

  version "1.0.0-a.33"
  sha256 arm:   "1b88d9d3f43a4c1b728ac12c8fc14af57f18aab44b588b12153b41520a23ee9b",
         intel: "0ef0f0a337272e0d2aa225a8e67e7de5ae50666d740095e0a68c56db66fbec8c"

  url "https://github.com/zen-browser/desktop/releases/download/#{version}/zen.macos-#{arch}.dmg"
  name "Zen Browser"
  desc "Zen web browser"
  homepage "https://github.com/zen-browser/desktop"

  livecheck do
    url :url
  end

  auto_updates true
  depends_on macos: ">= :catalina"

  app "Zen Browser.app"

  zap trash: [
        "~/Library/Application Support/zen",
        "~/Library/Preferences/org.mozilla.com.zen.browser.plist",
        "~/Library/Preferences/org.mozilla.librewolf.plist",
        "~/Library/Saved Application State/org.mozilla.librewolf.savedState",
      ],
      rmdir: [
        "/Library/Mozilla",
        "~/Library/Application Support/Mozilla",
        "~/Library/Caches/Mozilla",
        "~/Library/Caches/zen",
      ]
end
