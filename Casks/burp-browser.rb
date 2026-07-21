cask "burp-browser" do
  arch arm: "MacOsArm64", intel: "MacOsx"

  version "2026.3.3"
  sha256 :no_check

  url "https://portswigger-cdn.net/burp/releases/download?product=community&version=#{version}&type=#{arch}",
      verified: "portswigger-cdn.net/burp/releases/"
  name "Burp Chromium"
  desc "Chromium browser extracted from Burp Suite Community Edition"
  homepage "https://portswigger.net/burp/"

  livecheck do
    skip "No reliable way to identify downloadable Community releases"
  end

  conflicts_with cask: [
    "eloston-chromium",
    "freesmug-chromium",
  ]
  depends_on :macos

  app "Burp Suite Community Edition.app"

  zap trash: "~/.BurpSuite"
end
