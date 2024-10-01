cask "zen-browser" do
  arch arm: "aarch64", intel: "x64"

  version "1.0.1-a.7"
  sha256 arm:   "68b1882b96a25e3fff12d0b117208c6af4098afd44ae2db6137d6694893cc9ea",
         intel: "e594e5fcffb825ef0414b046488ea7dbfdb0bc1b4e668d0b7a440e68180e9b54"

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
