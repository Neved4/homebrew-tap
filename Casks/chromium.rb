cask "chromium" do
  arch arm: "Mac_Arm", intel: "Mac"

  version "132.0.6834.161,1381561"
  sha256 "60d5d9e2fe5b6424a0bfa123d42254ffd98a1388c27c722325ece51f691c0935"

  url "https://download-chromium.appspot.com/dl/#{arch}?type=snapshots",
      verified: "download-chromium.appspot.com/dl/"
  name "Chromium"
  desc "Free and open-source web browser"
  homepage "https://www.chromium.org/Home"

  livecheck do
    url "https://chromiumdash.appspot.com/fetch_releases?platform=Mac&channel=stable"
    strategy :page_match do |page|
      json = JSON.parse(page)
      second_latest = json[1]
      "#{second_latest["version"]},#{second_latest["chromium_main_branch_position"]}"
    end
  end

  conflicts_with cask: [
    "eloston-chromium",
    "freesmug-chromium",
  ]
  depends_on macos: ">= :big_sur"

  app "chrome-mac/Chromium.app"
  shimscript = "#{staged_path}/chromium.wrapper.sh"
  binary shimscript, target: "chromium"

  preflight do
    File.write shimscript, <<~EOS
      #!/bin/sh
      exec '#{appdir}/Chromium.app/Contents/MacOS/Chromium' "$@"
    EOS
  end

  postflight do
    dict = {
      "LSEnvironment.GOOGLE_API_KEY"               => "AIzaSyCkfPOPZXDKNn8hhgu3JrA62wIgC93d44k",
      "LSEnvironment.GOOGLE_DEFAULT_CLIENT_ID"     => "811574891467.apps.googleusercontent.com",
      "LSEnvironment.GOOGLE_DEFAULT_CLIENT_SECRET" => "kdloedMFGdGla2P1zacGjAQh",
    }

    plist = "#{appdir}/Chromium.app/Contents/Info.plist"

    dict.each do |key, val|
      system("plutil -replace #{key} -string '#{val}' #{plist}")
    end
  end

  zap trash: [
    "~/Library/Application Support/Chromium",
    "~/Library/Caches/Chromium",
    "~/Library/Preferences/org.chromium.Chromium.plist",
    "~/Library/Saved Application State/org.chromium.Chromium.savedState",
  ]
end
