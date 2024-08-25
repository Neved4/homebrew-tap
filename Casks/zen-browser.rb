cask "zen-browser" do
  arch arm: "aarch64", intel: "x64"

  version "1.0.0-a.29"
  sha256 arm:   "b9892f13bb1c8cd0c6ab0de73f923641ca0cce1bd68ecffaf683fd01fdd30251",
         intel: "934b294ba30586a31c2c62e88ef95c42312f9e0172e9977d495c909934d5ba25"

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
    "~/Library/Preferences/org.mozilla.com.zen.browser.plist",
    "~/Library/Saved Application State/org.mozilla.com.zen.browser.savedState",
  ]
end
