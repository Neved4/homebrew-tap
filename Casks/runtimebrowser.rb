cask "runtimebrowser" do
  version "0.996"
  sha256 "917fa8e5e5ee4d8bf580fa9eb7dea67087986a557c5b1ece7ce5e703b8f9a829"

  # seriot.ch was verified as official
  url "http://seriot.ch/temp/RuntimeBrowser_#{version}.zip"
  name "RuntimeBrowser"
  desc "Class browser for the Objective-C runtime"
  homepage "https://github.com/nst/RuntimeBrowser"

  livecheck do
    skip "No tagged version available"
  end

  app "RuntimeBrowser.app"

  zap trash: "~/Library/Preferences/ch.seriot.RuntimeBrowser.plist"
end
