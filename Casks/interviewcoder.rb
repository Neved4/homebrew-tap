cask "interviewcoder" do
  arch arm: "arm64", intel: "x64"

  version :latest
  sha256 :no_check

  url "https://downloads.v2.interviewcoder.co/downloads/interviewcoder-#{arch}.dmg"
  name "interviewcoder"
  desc "Provides assistance during coding interviews"
  homepage "https://www.interviewcoder.co/"

  depends_on macos: ">= :monterey"

  app "systemcontainer.app"
end
