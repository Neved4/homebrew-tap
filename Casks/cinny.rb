cask "cinny" do
  version "4.1.0"
  sha256 "ae08fbb024525331d3dfcdb7a8f253eaa810d412e98e9a3fffe0e8ec941377d5"

  url "https://github.com/cinnyapp/cinny-desktop/releases/download/v#{version}/Cinny_desktop-universal.app.tar.gz"
  name "cinny"
  desc "Yet another matrix client for desktop"
  homepage "https://github.com/cinnyapp/cinny-desktop"

  livecheck do
    url :url
    strategy :github_latest
  end

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
