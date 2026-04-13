cask "libation" do
  arch arm: "arm64", intel: "x64"

  version "13.3.3"
  sha256 arm:          "10f1a96f5fc1d7efd69ecbf79de2eff0cd5fcefaeee76cb878492bac63b068ab",
         intel:        "43d8d01ce976262223132afb1e19608f62a515b5013a3e0d76b744c52c2052eb",
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
