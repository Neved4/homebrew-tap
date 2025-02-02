cask "chromium-stable" do
  arch = { arm: "MacOsArm64", intel: "MacOsx" }

  version "2024.12.1"
  sha256 arm:   "969368a379fdaa3995dda410230a1b11f8189ab243572900dbecb8d0d0c82725",
         intel: "3d9cec0009285e5c9892537985e3b510d306ee6f2414b3980c4a4f2a794c21af"

  on_arm do
    url "https://portswigger-cdn.net/burp/releases/download?product=community&version=#{version}&type=MacOsArm64",
        verified: "portswigger-cdn.net/burp/releases/"
  end
  on_intel do
    url "https://portswigger-cdn.net/burp/releases/download?product=community&version=#{version}&type=MacOsx",
        verified: "portswigger-cdn.net/burp/releases/"
  end

  name "Burp Chromium"
  desc "Chromium browser extracted from Burp Suite Community Edition"
  homepage "https://portswigger.net/burp/"

  livecheck do
    strategy :json do |json|
      json.dig("ResultSet", "Results")&.filter_map do |item|
        if item["releaseChannels"]&.include?("Stable") &&
           item["categories"]&.include?("Community") &&
           item["builds"]&.any? do |build|
             build["ProductPlatform"] == (on_arm do
               "MacOsArm64"
             end
                                          on_intel do
                                            "MacOsx"
                                          end)
           end
          item["version"]
        end
      end
    end
  end

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
