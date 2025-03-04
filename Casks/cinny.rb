cask "cinny" do
  version "4.5.0"
  sha256 "c55524825ce458bcfc4eed3112a10ae2b9fbae67a56295c51ea41b5def5aebcb"

  url "https://github.com/cinnyapp/cinny-desktop/releases/download/v#{version}/Cinny_desktop-universal.app.tar.gz"
  name "cinny"
  desc "Yet another matrix client for desktop"
  homepage "https://github.com/cinnyapp/cinny-desktop"

  auto_updates true
  depends_on macos: ">= :high_sierra"

  app "Cinny.app"

  zap trash: [
    "~/Library/Caches/in.cinny.app",
    "~/Library/Preferences/in.cinny.app.plist",
    "~/Library/Saved Application State/in.cinny.app.savedState",
    "~/Library/WebKit/in.cinny.app",
  ]
end
