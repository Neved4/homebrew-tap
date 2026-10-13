cask "spacestation14" do
  version "0.40.2"
  sha256 "d0de678667938de8171391b15d43ded89744692e5a7e09231a0544490d87ff36"

  url "https://github.com/space-wizards/SS14.Launcher/releases/download/v#{version}/SS14.Launcher_macOS.zip"
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
