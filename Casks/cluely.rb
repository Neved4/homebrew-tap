cask "cluely" do
	version "1.88.3"
	sha256 "c15c7a305db939a9bb1992c26ed3bd33f30e6144a80f788a5165f7c522cadd6e"

	url "https://downloads.cluely.com/downloads/cluely.dmg"
	name "Cluely"
	desc "AI meeting assistant with live notes and real-time insights"
	homepage "https://cluely.com/"

	auto_updates true
	depends_on macos: ">= :monterey"

	app "Cluely.app"

	zap trash: [
		"~/Library/Application Support/Cluely",
		"~/Library/Caches/com.cluely.app",
		"~/Library/Logs/Cluely",
		"~/Library/Preferences/com.cluely.app.plist",
		"~/Library/Saved Application State/com.cluely.app.savedState",
	]
end
