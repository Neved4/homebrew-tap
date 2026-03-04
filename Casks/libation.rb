cask "libation" do
  arch arm: "arm64", intel: "x64"

  version "13.1.10"
  sha256 arm:   "6b80f86507f67854858c1a4435061acfa934bd01f4e9967ba11b6f29d6c86580",
         intel: "18a5c934d26002885462721884e4a52557e78fe63730ef10cf0e21a9efde3fd8"

  url "https://github.com/rmcrackan/Libation/releases/download/v#{version}/Libation.#{version}-macOS-chardonnay-#{arch}.dmg",
      verified: "github.com/rmcrackan/Libation/"
  name "Libation"
  desc "Audible library manager"
  homepage "https://getlibation.com/"

  app "Libation.app"

  zap trash: "~/Library/Application Support/Libation"
end
