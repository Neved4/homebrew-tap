cask "spacestation14" do
  version "0.36.1"
  sha256 "ff5f82a21cc562e41fca42c0291413ebd6d7c4b3c4f600d7979f7355ad501f98"

  url "https://github.com/space-wizards/SS14.Launcher/releases/download/v#{version}/SS14.Launcher_macOS.zip",
      verified: "github.com/space-wizards/SS14.Launcher/"
  name "Space Station 14 Launcher"
  desc "Launcher for Space Station 14 game"
  homepage "https://spacestation14.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Space Station 14 Launcher.app"
end
