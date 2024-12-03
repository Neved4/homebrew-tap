cask "font-monego" do
  version "0.0.0,ad2acdcfc48277dabdededd3a46f1348f720d110"
  sha256 "62a0135b020858a024736b6b3415ae5f37240c31cca138b849f4a906e12c69da"

  url "https://github.com/cseelus/monego/archive/#{version.csv.second}.tar.gz"
  name "Monego"
  desc "Beloved Monaco monospaced font, recreated with bold and italic variants"
  homepage "https://github.com/cseelus/monego"

  livecheck do
    skip "No tagged version available"
  end

  font "monego-#{version.csv.second}/Monego/Monego-Bold.otf"
  font "monego-#{version.csv.second}/Monego/Monego-BoldItalic.otf"
  font "monego-#{version.csv.second}/Monego/Monego-Italic.otf"
  font "monego-#{version.csv.second}/Monego/Monego-Regular.otf"
  # Monego with ligatures
  font "monego-#{version.csv.second}/Monego-with-ligatures/MonegoLigatures-Bold.otf"
  font "monego-#{version.csv.second}/Monego-with-ligatures/MonegoLigatures-BoldItalic.otf"
  font "monego-#{version.csv.second}/Monego-with-ligatures/MonegoLigatures-Italic.otf"
  font "monego-#{version.csv.second}/Monego-with-ligatures/MonegoLigatures-Regular.otf"
  # Monego with ligatures and nerd font glyphs
  font "monego-#{version.csv.second}/Monego-Nerd-Font/Monego_Nerd_Fixed-Bold.otf"
  font "monego-#{version.csv.second}/Monego-Nerd-Font/Monego_Nerd_Fixed-BoldItalic.otf"
  font "monego-#{version.csv.second}/Monego-Nerd-Font/Monego_Nerd_Fixed-Italic.otf"
  font "monego-#{version.csv.second}/Monego-Nerd-Font/Monego_Nerd_Fixed-Regular.otf"
end
