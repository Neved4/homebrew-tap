cask "ungoogled-chromium" do
  arch arm: "arm64", intel: "x86-64"

  version "130.0.6723.91-1.1"
  sha256 arm:   "2ec29e225d0a07e05abdc2693641181d6150728a268cab9478233886a2b72a70",
         intel: "5f92a04fd84cb5c5cf410fada746e37ca38998338c30ae911ef41d58580155c0"

  url "https://github.com/ungoogled-software/ungoogled-chromium-macos/releases/download/#{version}/ungoogled-chromium_#{version}_#{arch}-macos.dmg",
      verified: "github.com/ungoogled-software/ungoogled-chromium-macos/"
  name "Ungoogled Chromium"
  desc "Google Chromium, sans integration with Google"
  homepage "https://ungoogled-software.github.io/"

  depends_on macos: ">= :big_sur"

  app "Chromium.app", target: "Ungoogled Chromium.app"

  zap trash: [
    "~/Library/Application Support/Chromium",
    "~/Library/Caches/Chromium",
    "~/Library/Preferences/org.chromium.Chromium.plist",
    "~/Library/Saved Application State/org.chromium.Chromium.savedState",
  ]
end
