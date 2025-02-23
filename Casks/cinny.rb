cask "cinny" do
  version "4.4.0"
  sha256 "a2a84adb3b27ee6d1c3a4d9375b943b607e074bcdeaddddf8f53419155143756"

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
