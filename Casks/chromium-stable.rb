cask "chromium-stable" do
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
    "chromium-enabled",
    "chromium-ungoogled",
  ]

  postflight do
    burp_app = staged_path.join("Burp Suite Community Edition.app")
    chromium_version = Dir.glob(burp_app.join("Contents/Resources/app/burpbrowser/*")).map do |p|
      File.basename(p)
    end.first
    chromium_app = burp_app.join("Contents/Resources/app/burpbrowser/#{chromium_version}/Chromium.app")

    if chromium_app.exist?
      system_command "/bin/mv",
                     args: [chromium_app, "#{appdir}/Chromium.app"],
                     sudo: false
    else
      opoo "Chromium.app was not found at expected location: #{chromium_app}"
    end
  end

  uninstall delete: "#{appdir}/Chromium.app"

  zap trash: "~/.BurpSuite"
end
