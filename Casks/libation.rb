cask "libation" do
  arch arm: "arm64", intel: "x64"

  version "13.3.0"
  sha256 arm:          "6cdcbfb3a2851c5c1713008600b1e069ebda42423e1cbac465bec23d5ee14f0f",
         intel:        "c511d6a836d5b0e3310d34f7bc26ea6e87f1579d2aa5b83769c978517c56c6ad",
         arm64_linux:  "0", # workaround for brew bug: Homebrew/homebrew-cask#205491
         x86_64_linux: "0"

  url "https://github.com/rmcrackan/Libation/releases/download/v#{version}/Libation.#{version}-macOS-chardonnay-#{arch}.dmg",
      verified: "github.com/rmcrackan/Libation/"
  name "Libation"
  desc "Audible library manager"
  homepage "https://getlibation.com/"

  app "Libation.app"

  zap trash: "~/Library/Application Support/Libation"
end
