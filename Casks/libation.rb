cask "libation" do
  arch arm: "arm64", intel: "x64"

  version "13.3.2"
  sha256 arm:          "68807e1679e0d263f7b136cb90df01c856b84dcfa901347129b4af218129b81d",
         intel:        "b912f8325d53731b17ac4080a033f150abe9d7004e34b9dacd020457573490a8",
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
