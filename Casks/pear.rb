cask "pear" do
  arch arm: "-arm64", intel: ""

  version "3.11.0"
  sha256 arm:          "a2d68bd80117ce376a08229f5cfb0a4570d98aba4e56af8040c725b22e856e0d",
         intel:        "27f74b53c7c4dd8c77ce44d7c7d0f955cb083e5251701e6ca2b3781e85c4e373",
         arm64_linux:  "0", # workaround for brew bug https://github.com/orgs/Homebrew/discussions/6008, https://github.com/Homebrew/homebrew-cask/issues/205491
         x86_64_linux: "0"

  url "https://github.com/pear-devs/pear-desktop/releases/download/v#{version}/YouTube-Music-3.11.0#{arch}.dmg"
  name "Pear Desktop"
  desc "YouTube Music desktop app"
  homepage "https://github.com/pear-devs/pear-desktop"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :monterey"

  app "YouTube Music.app"

  postflight do
    print("Removing quarantine attribute from YouTube Music.app.\n")
    system "xattr -cr '/Applications/YouTube Music.app'"
  end

  zap trash: [
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.github.th-ch.youtube-music.sfl*",
    "~/Library/Preferences/com.github.th-ch.youtube-music.plist",
  ]
end
