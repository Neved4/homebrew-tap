cask "cluely" do
  version "1.88.3"
  sha256 :no_check

  url "https://downloads.cluely.com/downloads/cluely.dmg"
  name "Cluely"
  desc "AI meeting assistant with live notes and real-time insights"
  homepage "https://cluely.com/"

  auto_updates true
  depends_on macos: ">= :monterey"

  app "Cluely.app"

  zap trash: [
    "~/Library/Application Support/cluely",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.cluely.app.sfl*",
    "~/Library/Caches/com.cluely.app",
    "~/Library/Logs/Cluely",
    "~/Library/Preferences/com.cluely.app.plist",
    "~/Library/Saved Application State/com.cluely.app.savedState",
  ]
end
