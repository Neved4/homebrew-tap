cask "burp-browser" do
  arch arm: "MacOsArm64", intel: "MacOsx"

  version "2026.2.4"
  sha256 :no_check

  url "https://portswigger-cdn.net/burp/releases/download?product=community&version=#{version}&type=#{arch}",
      verified: "portswigger-cdn.net/burp/releases/"
  name "Burp Chromium"
  desc "Chromium browser extracted from Burp Suite Community Edition"
  homepage "https://portswigger.net/burp/"

  livecheck do
    url "https://portswigger.net/burp/releases/data"
    strategy :json do |json|
      all_versions = json.dig("ResultSet", "Results")
      next if all_versions.blank?

      all_versions.filter_map do |item|
        item["version"] if
              item["releaseChannels"]&.include?("Stable") &&
              item["categories"]&.include?("Community") &&
              item["builds"]&.any? do |build|
                build["BuildCategoryPlatform"] == arch.to_s
              end
      end
    end
  end

  conflicts_with cask: [
    "eloston-chromium",
    "freesmug-chromium",
  ]

  app "Burp Suite Community Edition.app"

  zap trash: "~/.BurpSuite"
end
