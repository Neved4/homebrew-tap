cask "libation" do
  arch arm: "arm64", intel: "x64"

  version "13.1.9"
  sha256 arm:          "72bc98cd08ea4b80ba66529d85f44d46573f53470127806aedb871d82aec0829",
         intel:        "245b0556c11f2d9ddda18f5be6ce38ef4d612c5f73c9af03943ad3899f8c81bf",
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
