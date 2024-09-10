cask "zen-browser" do
  arch arm: "aarch64", intel: "x64"

  version "1.0.0-a.39"
  sha256 arm:   "9e637193ef722ffab3491a7fe9a2a1725c562d8ee21bea38df08dc5d90067cb0",
         intel: "19df7b246926537808f1d78534e305893bb0d4505e0c5a303a58efeaa930a3b4"

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
