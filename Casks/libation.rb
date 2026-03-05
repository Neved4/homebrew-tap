cask "libation" do
  arch arm: "arm64", intel: "x64"

  version "13.2.1"
  sha256 arm:   "b05dd70fe6d97fb499164e9dd030d8e04c62e8050c3519bff23e873c318a37dd",
         intel: "3d773194cf8ce1b2534379ac83a2f8d87d334b00ffb7f4e426305fe9470a3b8e"

  url "https://github.com/rmcrackan/Libation/releases/download/v#{version}/Libation.#{version}-macOS-chardonnay-#{arch}.dmg",
      verified: "github.com/rmcrackan/Libation/"
  name "Libation"
  desc "Audible library manager"
  homepage "https://getlibation.com/"

  app "Libation.app"

  zap trash: "~/Library/Application Support/Libation"
end
