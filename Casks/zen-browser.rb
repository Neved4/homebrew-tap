cask "zen-browser" do
  arch arm: "aarch64", intel: "x64"

  version "1.0.1-a.1"
  sha256 arm:   "b7ed2c901ec3294ed126b969f55f41e5a709952b3193db10559ca4b599158940",
         intel: "c24de599a5189e79e6b5a390b973e4d31abecc60353c8e79bf693a0ff44690f8"

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
