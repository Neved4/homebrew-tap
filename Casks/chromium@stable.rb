cask "chromium@stable" do
  arch arm: "MacOsArm64", intel: "MacOsx"

  version "2024.12.1"
  sha256 arm:   "969368a379fdaa3995dda410230a1b11f8189ab243572900dbecb8d0d0c82725",
         intel: "3d9cec0009285e5c9892537985e3b510d306ee6f2414b3980c4a4f2a794c21af"

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

  postflight do
    chromium_app = Dir[
      "#{staged_path}/Burp Suite Community Edition.app/Contents/Resources/app/" \
      "burpbrowser/*/Chromium.app"
    ].first

    if chromium_app
      FileUtils.mv chromium_app, "#{appdir}/Chromium.app"
    else
      opoo "Chromium.app was not found in the expected location."
    end
  end

  uninstall delete: "#{appdir}/Chromium.app"

  zap trash: "~/.BurpSuite"
end
