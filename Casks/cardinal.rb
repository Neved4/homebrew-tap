cask "cardinal" do
  version "24.09"
  sha256 "bc763c50325f46f519f4ed77c99563e8c9d176cd4a250d50265d704b8aa08b3a"

  url "https://github.com/DISTRHO/Cardinal/releases/download/#{version}/Cardinal-macOS-universal-10.15-#{version}.pkg"
  name "Cardinal"
  desc "Virtual modular synthesiser plugin"
  homepage "https://github.com/DISTRHO/Cardinal"

  system "curl", "-L", "-O", "#{url}"
  system "pkgutil", "--expand", "Cardinal-macOS-universal-10.15-#{version}.pkg", "/opt/homebrew/Caskroom/cardinal/#{version}/tmpdir"
  system "sudo", "installer", "-pkg", "/opt/homebrew/Caskroom/cardinal/#{version}/tmpdir/dpf-cardinal-resources.pkg", "-target", "/"
  system "sudo", "installer", "-pkg", "/opt/homebrew/Caskroom/cardinal/#{version}/tmpdir/dpf-cardinal-vst3bundles.pkg", "-target", "/"
  system "sudo", "rm", "-rf", "/opt/homebrew/Caskroom/cardinal/#{version}/tmpdir"

  uninstall pkgutil: [
    "studio.kx.distrho.cardinal.resources",
    "studio.kx.distrho.plugins.cardinal.clapbundles",
    "studio.kx.distrho.plugins.cardinal.components",
    "studio.kx.distrho.plugins.cardinal.jack",
    "studio.kx.distrho.plugins.cardinal.lv2bundles",
    "studio.kx.distrho.plugins.cardinal.native",
    "studio.kx.distrho.plugins.cardinal.vst2bundles",
    "studio.kx.distrho.plugins.cardinal.vst3bundles",
  ]

  zap trash: [
    "/Applications/CardinalJACK.app",
    "/Applications/CardinalNative.app",
    "/Library/Audio/Plug-Ins/CLAP/Cardinal.clap",
    "/Library/Audio/Plug-Ins/CLAP/CardinalFX.clap",
    "/Library/Audio/Plug-Ins/CLAP/CardinalSynth.clap",
    "/Library/Audio/Plug-Ins/Components/CardinalFX.component",
    "/Library/Audio/Plug-Ins/Components/CardinalSynth.component",
    "/Library/Audio/Plug-Ins/LV2/Cardinal.lv2",
    "/Library/Audio/Plug-Ins/LV2/CardinalFX.lv2",
    "/Library/Audio/Plug-Ins/LV2/CardinalMini.lv2",
    "/Library/Audio/Plug-Ins/LV2/CardinalSynth.lv2",
    "/Library/Audio/Plug-Ins/VST/CardinalFX.vst",
    "/Library/Audio/Plug-Ins/VST/CardinalSynth.vst",
  ]
end
