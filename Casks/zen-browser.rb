cask "zen-browser" do
  arch arm: "aarch64", intel: "x64"

  version "1.0.1-a.2"
  sha256 arm:   "e8e9f9c305ab2806cb6fa66e15b76f9d63e271deb029115763fc9b18d7cc4d54",
         intel: "2974c1c2d447450498c6f5a38d7ded3fb323306343302ff264f3aff05d3c7852"

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
