cask "lofloccus" do
  version "1.2.4"
  sha256 "1258e8a89c96a182a010da1c69f428293b58aa22b3e4845a72155822e438bc2b"

  url "https://github.com/TCB13/LoFloccus/releases/download/#{version}/LoFloccus-#{version.dots_to_hyphens}-macOS.zip"
  name "LoFloccus"
  desc "Sync Floccus bookmarks to a local folder or any cloud service"
  homepage "https://github.com/TCB13/LoFloccus"

  livecheck do
    url "https://api.github.com/repos/TCB13/LoFloccus/releases"
    strategy :json do |json|
      json.filter_map do |release|
        next if release["draft"] || release["prerelease"]
        next unless release["assets"]&.any? { |asset| asset["name"]&.match?(/macOS\.zip\z/i) }

        release["tag_name"]
      end
    end
  end

  depends_on :macos

  app "LoFloccus.app"

  zap trash: "~/Library/Preferences/LoFloccus"

  caveats do
    requires_rosetta
  end
end
