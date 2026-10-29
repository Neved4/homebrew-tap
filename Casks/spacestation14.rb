cask "spacestation14" do
  version "0.40.4"
  sha256 "137796d8e3dd4be0f500f486e27b3e7a6ec7ea2d37f558551ef0af8a63657db8"

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
