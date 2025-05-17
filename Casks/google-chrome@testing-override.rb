cask "google-chrome@testing-override" do
  arch arm: "arm64", intel: "x64"

  version "136.0.7103.94"
  sha256 :no_check

  url "https://storage.googleapis.com/chrome-for-testing-public/#{version}/mac-#{arch}/chrome-mac-#{arch}.zip",
      verified: "storage.googleapis.com/chrome-for-testing-public/"
  name "Google Chrome for Testing"
  desc "Official Chrome build for testing automation"
  homepage "https://googlechromelabs.github.io/chrome-for-testing/"

  livecheck do
    url "https://googlechromelabs.github.io/chrome-for-testing/last-known-good-versions-with-downloads.json"
    strategy :page_match do |page|
      data = JSON.parse(page)
      data.dig("channels", "Stable", "version")
    end
  end

  auto_updates false
  conflicts_with cask: "google-chrome"
  depends_on macos: ">= :big_sur"

  app "chrome-mac-#{arch}/Google Chrome for Testing.app", target: "Google Chrome.app"

  preflight do
    cask_file_dir = Pathname.new(__FILE__).dirname

    FileUtils.cp(cask_file_dir/"../Resources/google-chrome.icns",
                 "#{staged_path}/chrome-mac-#{arch}/Google Chrome for Testing.app/Contents/Resources/app.icns")
  end

  zap trash: [
        "~/Library/Application Support/Google/Chrome for Testing",
        "~/Library/Caches/com.google.ChromeTesting",
        "~/Library/Preferences/com.google.ChromeTesting.plist",
        "~/Library/Saved Application State/com.google.ChromeTesting.savedState",
      ],
      rmdir: [
        "~/Library/Application Support/Google/Chrome for Testing",
        "~/Library/Caches/Google",
        "~/Library/Google",
      ]
end
