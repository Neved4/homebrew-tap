cask "font-monego" do
  version "0.0.0-ad2acdcfc48277dabdededd3a46f1348f720d110"
  sha256 "62a0135b020858a024736b6b3415ae5f37240c31cca138b849f4a906e12c69da"
  upstream_hash = version.split("-")[1]

  url "https://github.com/cseelus/monego/archive/#{upstream_hash}.tar.gz"
  name "Monego"
  desc "The beloved Monaco monospaced font, recreated with bold and italic variants."
  homepage "https://github.com/cseelus/monego"

  livecheck do
    skip "No tagged version available"
  end

  font "monego-#{upstream_hash}/Monego/Monego-Bold.otf"
  font "monego-#{upstream_hash}/Monego/Monego-BoldItalic.otf"
  font "monego-#{upstream_hash}/Monego/Monego-Italic.otf"
  font "monego-#{upstream_hash}/Monego/Monego-Regular.otf"

  font "monego-#{upstream_hash}/Monego-with-ligatures/MonegoLigatures-Bold.otf"
  font "monego-#{upstream_hash}/Monego-with-ligatures/MonegoLigatures-BoldItalic.otf"
  font "monego-#{upstream_hash}/Monego-with-ligatures/MonegoLigatures-Italic.otf"
  font "monego-#{upstream_hash}/Monego-with-ligatures/MonegoLigatures-Regular.otf"

  font "monego-#{upstream_hash}/Monego-Nerd-Font/Monego_Nerd_Fixed-Bold.otf"
  font "monego-#{upstream_hash}/Monego-Nerd-Font/Monego_Nerd_Fixed-BoldItalic.otf"
  font "monego-#{upstream_hash}/Monego-Nerd-Font/Monego_Nerd_Fixed-Italic.otf"
  font "monego-#{upstream_hash}/Monego-Nerd-Font/Monego_Nerd_Fixed-Regular.otf"
end
