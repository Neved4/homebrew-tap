cask "spacestation14" do
  version "0.40.3"
  sha256 "55a902dea972e3449adeb12974a0136634114f899fe4d4a6fd6a38c841578580"

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
