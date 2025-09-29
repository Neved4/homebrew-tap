cask "cinny" do
  version "4.10.1"
  sha256 "b2bc92dea8e873506707e7e1dfef4b40009ec200e65b147db5bcd70bfdfab345"

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
