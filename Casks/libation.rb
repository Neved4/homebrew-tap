cask "libation" do
  arch arm: "arm64", intel: "x64"

  version "13.1.8"
  sha256 arm:          "b1c6b1b13db988b49da4a5869a55e7d2e24f3310d2cfc01acf3a7d1b2cfef08c",
         intel:        "9f7fefa770ac54390b17c12c77a2a38701ee65a45387ad595d21e27575a21a34",
         arm64_linux:  "0", # workaround for brew bug https://github.com/orgs/Homebrew/discussions/6008, https://github.com/Homebrew/homebrew-cask/issues/205491
         x86_64_linux: "0"

  url "https://github.com/rmcrackan/Libation/releases/download/v#{version}/Libation.#{version}-macOS-chardonnay-#{arch}.dmg",
      verified: "github.com/rmcrackan/Libation/"
  name "Libation"
  desc "Audible library manager"
  homepage "https://getlibation.com/"

  app "Libation.app"

  zap trash: "~/Library/Application Support/Libation"
end
