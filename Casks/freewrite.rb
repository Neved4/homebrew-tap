cask "freewrite" do
  version :latest
  sha256 :no_check

  url "https://github.com/farzaa/freewrite/releases/download/prod/freewrite.zip",
      verified: "github.com/farzaa/freewrite/"
  name "freewrite"
  desc "Write continuously without distraction"
  homepage "https://freewrite.io/"

  depends_on macos: ">= :ventura"

  app "freewrite.app"

  zap trash: "~/Library/Application Scripts/app.humansongs.freewrite"
end
