cask "cinny" do
  version "4.12.6"
  sha256 "8af526fe721ebf9e45d09a3d1d202f439a0e376abb53e4dbe56e9aad02ce32fd"

  url "https://github.com/cinnyapp/cinny-desktop/releases/download/v#{version}/Cinny_desktop-universal.app.tar.gz"
  name "cinny"
  desc "Yet another matrix client for desktop"
  homepage "https://github.com/cinnyapp/cinny-desktop"

  auto_updates true
  depends_on :macos

  app "Cinny.app"

  zap trash: [
    "~/Library/Caches/in.cinny.app",
    "~/Library/Preferences/in.cinny.app.plist",
    "~/Library/Saved Application State/in.cinny.app.savedState",
    "~/Library/WebKit/in.cinny.app",
  ]
end
