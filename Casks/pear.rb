cask "pear" do
  arch arm: "-arm64", intel: ""

  version "3.12.0"
  sha256 arm:          "1266b1efdf3cd22276b989445ea14f0afd6bc751c26fc0983f24dd527be2f724",
         intel:        "76e4a859cfbb777ca4383f83455a4ee01a8345356b86f0a91395b9e7dda6a863",
         arm64_linux:  "0", # workaround for brew bug https://github.com/orgs/Homebrew/discussions/6008, https://github.com/Homebrew/homebrew-cask/issues/205491
         x86_64_linux: "0"

  url "https://github.com/pear-devs/pear-desktop/releases/download/v#{version}/YouTube-Music-#{version}#{arch}.dmg"
  name "Pear Desktop"
  desc "YouTube Music desktop app"
  homepage "https://github.com/pear-devs/pear-desktop"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :monterey

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
