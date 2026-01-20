cask "libation" do
  arch arm: "arm64", intel: "x64"

  version "13.1.3"
  sha256 arm:          "4de5da9d042c638df8dd335ae257665876588fdfc76ef37bf4c31b057e92deea",
         intel:        "7a7058104567750e524cdebb2cc453d3b420cfc0dc8ef132f6e871511586fce8",
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
