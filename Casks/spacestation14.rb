cask "spacestation14" do
  version "0.37.1"
  sha256 "d890dea319da757b588b1a48ef23d4a955795d3ef0b9a4d1757f3164ba1a053e"

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
