cask "zen-browser" do
  arch arm: "aarch64", intel: "x64"

  version "1.0.1-a.4"
  sha256 arm:   "6374ba67ab238e1396e9c5ca76c6dad20879d857894de1ee10341ad207548925",
         intel: "33129c1683ee90ebf10ea52f5bdc28891b1445ca684a38d9dae66828fc92cb0b"

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
