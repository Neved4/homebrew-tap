cask "libation" do
  arch arm: "arm64", intel: "x64"

  version "13.3.5"
  sha256 arm:          "ac8e43057107e1f4c0fc22824e047b77560d7a393f70ff1cb5d694300f1d3a45",
         intel:        "ac289f223099c39bd74362a2870e74030661cedb017e7a55856c42d21b086c4f",
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
