cask "chromium@stable" do
  arch arm: "MacOsArm64", intel: "MacOsx"

  version "2025.1.2"
  sha256 arm:   "b29046aee62713a312d29d1b9d0c7e70ff6d169526ac3864a4036e87daa805e6",
         intel: "de46107eed0d389c546208e48b5cfdc3351ec8111d1ba708c064d32d308978b1"

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
                build["ProductPlatform"] == arch.to_s
              end
      end
    end
  end

  conflicts_with cask: [
    "eloston-chromium",
    "freesmug-chromium",
  ]

  chromium_app = Dir[
    "#{staged_path}/Burp Suite Community Edition.app/Contents/Resources/app/" \
    "burpbrowser/*/Chromium.app"
  ].first
  app chromium_app.to_s

  uninstall delete: "#{appdir}/Chromium.app"

  zap trash: "~/.BurpSuite"
end
