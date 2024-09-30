cask "zen-browser" do
  arch arm: "aarch64", intel: "x64"

  version "1.0.1-a.6"
  sha256 arm:   "39bf91ea0d3f0cd274d8e9fd5d2ade895789f883082ad19b1eb779a97c5d3a23",
         intel: "c33f040eedc69443b715fc3924e2d620d052aef6256e5802dd4aa8efbfbe9c88"

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
