cask "chromium@api" do
  arch arm: "Mac_Arm", intel: "Mac"

  version :latest
  sha256 :no_check

  url "https://download-chromium.appspot.com/dl/#{arch}?type=snapshots"
  name "Chromium"
  desc "Free and open-source web browser"
  homepage "https://www.chromium.org/Home"

  conflicts_with cask: [
    "eloston-chromium",
    "freesmug-chromium",
  ]
  depends_on macos: :ventura

  app "chrome-mac/Chromium.app"
  shimscript = "#{staged_path}/chromium.wrapper.sh"
  binary shimscript, target: "chromium"

  preflight_steps do
    run "/bin/sh", args: [
      "-c",
      "cat > '{{staged_path}}/chromium.wrapper.sh' <<'EOF'\n#!/bin/sh\nexec '{{appdir}}/Chromium.app/Contents/MacOS/Chromium' \"$@\"\nEOF\nchmod +x '{{staged_path}}/chromium.wrapper.sh'",
    ]
  end

  postflight_steps do
    run "/usr/bin/plutil", args: [
      "-replace", "LSEnvironment.GOOGLE_API_KEY", "-string",
      "AIzaSyCkfPOPZXDKNn8hhgu3JrA62wIgC93d44k", "{{appdir}}/Chromium.app/Contents/Info.plist",
    ]
    run "/usr/bin/plutil", args: [
      "-replace", "LSEnvironment.GOOGLE_DEFAULT_CLIENT_ID", "-string",
      "811574891467.apps.googleusercontent.com", "{{appdir}}/Chromium.app/Contents/Info.plist",
    ]
    run "/usr/bin/plutil", args: [
      "-replace", "LSEnvironment.GOOGLE_DEFAULT_CLIENT_SECRET", "-string",
      "kdloedMFGdGla2P1zacGjAQh", "{{appdir}}/Chromium.app/Contents/Info.plist",
    ]
  end

  zap trash: [
    "~/Library/Application Support/Chromium",
    "~/Library/Caches/Chromium",
    "~/Library/Preferences/org.chromium.Chromium.plist",
    "~/Library/Saved Application State/org.chromium.Chromium.savedState",
  ]
end
