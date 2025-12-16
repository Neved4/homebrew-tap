cask "lofloccus" do
  version "1.2.4"
  sha256 "1258e8a89c96a182a010da1c69f428293b58aa22b3e4845a72155822e438bc2b"

  url "https://github.com/TCB13/LoFloccus/releases/download/#{version}/LoFloccus-#{version.dots_to_hyphens}-macOS.zip"
  name "LoFloccus"
  desc "Sync Floccus bookmarks to a local folder or any cloud service"
  homepage "https://github.com/TCB13/LoFloccus"

  app "LoFloccus.app"

  zap trash: "~/Library/Preferences/LoFloccus"

  caveats do
    requires_rosetta
  end
end
