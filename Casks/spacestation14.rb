cask "spacestation14" do
  version "0.39.1"
  sha256 "b4182b67ebc2a4e53408b77d4a50949f376b2735c420fd03e5bcd0bdfda15dbb"

  url "https://github.com/space-wizards/SS14.Launcher/releases/download/v#{version}/SS14.Launcher_macOS.zip",
      verified: "github.com/space-wizards/SS14.Launcher/"
  name "Space Station 14 Launcher"
  desc "Launcher for Space Station 14 game"
  homepage "https://spacestation14.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Space Station 14 Launcher.app"
end
