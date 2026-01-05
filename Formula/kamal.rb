class Kamal < Formula
  desc "Deploy web apps in containers to servers running Docker with zero downtime"
  homepage "https://github.com/basecamp/kamal"
  url "https://rubygems.org/downloads/kamal-2.10.1.gem"
  sha256 "53b7ecb4c33dd83b1aedfc7aacd1c059f835993258a552d70d584c6ce32b6340"
  license "MIT"

  depends_on "ruby"

  resource "activesupport" do
    url "https://rubygems.org/downloads/activesupport-8.1.1.gem"
    sha256 "5e92534e8d0c8b8b5e6b16789c69dbea65c1d7b752269f71a39422e9546cea67"
  end

  resource "base64" do
    url "https://rubygems.org/downloads/base64-0.3.0.gem"
    sha256 "27337aeabad6ffae05c265c450490628ef3ebd4b67be58257393227588f5a97b"
  end

  resource "bcrypt_pbkdf" do
    url "https://rubygems.org/downloads/bcrypt_pbkdf-1.1.2.gem"
    sha256 "c2414c23ce66869b3eb9f643d6a3374d8322dfb5078125c82792304c10b94cf6"
  end

  resource "bigdecimal" do
    url "https://rubygems.org/downloads/bigdecimal-4.0.1.gem"
    sha256 "8b07d3d065a9f921c80ceaea7c9d4ae596697295b584c296fe599dd0ad01c4a7"
  end

  resource "concurrent-ruby" do
    url "https://rubygems.org/downloads/concurrent-ruby-1.3.6.gem"
    sha256 "6b56837e1e7e5292f9864f34b69c5a2cbc75c0cf5338f1ce9903d10fa762d5ab"
  end

  resource "connection_pool" do
    url "https://rubygems.org/downloads/connection_pool-3.0.2.gem"
    sha256 "33fff5ba71a12d2aa26cb72b1db8bba2a1a01823559fb01d29eb74c286e62e0a"
  end

  resource "dotenv" do
    url "https://rubygems.org/downloads/dotenv-3.2.0.gem"
    sha256 "e375b83121ea7ca4ce20f214740076129ab8514cd81378161f11c03853fe619d"
  end

  resource "drb" do
    url "https://rubygems.org/downloads/drb-2.2.3.gem"
    sha256 "0b00d6fdb50995fe4a45dea13663493c841112e4068656854646f418fda13373"
  end

  resource "ed25519" do
    url "https://rubygems.org/downloads/ed25519-1.4.0.gem"
    sha256 "16e97f5198689a154247169f3453ef4cfd3f7a47481fde0ae33206cdfdcac506"
  end

  resource "i18n" do
    url "https://rubygems.org/downloads/i18n-1.14.8.gem"
    sha256 "285778639134865c5e0f6269e0b818256017e8cde89993fdfcbfb64d088824a5"
  end

  resource "json" do
    url "https://rubygems.org/downloads/json-2.18.0.gem"
    sha256 "b10506aee4183f5cf49e0efc48073d7b75843ce3782c68dbeb763351c08fd505"
  end

  resource "logger" do
    url "https://rubygems.org/downloads/logger-1.7.0.gem"
    sha256 "196edec7cc44b66cfb40f9755ce11b392f21f7967696af15d274dde7edff0203"
  end

  resource "minitest" do
    url "https://rubygems.org/downloads/minitest-6.0.1.gem"
    sha256 "7854c74f48e2e975969062833adc4013f249a4b212f5e7b9d5c040bf838d54bb"
  end

  resource "net-scp" do
    url "https://rubygems.org/downloads/net-scp-4.1.0.gem"
    sha256 "a99b0b92a1e5d360b0de4ffbf2dc0c91531502d3d4f56c28b0139a7c093d1a5d"
  end

  resource "net-sftp" do
    url "https://rubygems.org/downloads/net-sftp-4.0.0.gem"
    sha256 "65bb91c859c2f93b09826757af11b69af931a3a9155050f50d1b06d384526364"
  end

  resource "net-ssh" do
    url "https://rubygems.org/downloads/net-ssh-7.3.0.gem"
    sha256 "172076c4b30ce56fb25a03961b0c4da14e1246426401b0f89cba1a3b54bf3ef0"
  end

  resource "ostruct" do
    url "https://rubygems.org/downloads/ostruct-0.6.3.gem"
    sha256 "95a2ed4a4bd1d190784e666b47b2d3f078e4a9efda2fccf18f84ddc6538ed912"
  end

  resource "prism" do
    url "https://rubygems.org/downloads/prism-1.7.0.gem"
    sha256 "10062f734bf7985c8424c44fac382ac04a58124ea3d220ec3ba9fe4f2da65103"
  end

  resource "securerandom" do
    url "https://rubygems.org/downloads/securerandom-0.4.1.gem"
    sha256 "cc5193d414a4341b6e225f0cb4446aceca8e50d5e1888743fac16987638ea0b1"
  end

  resource "sshkit" do
    url "https://rubygems.org/downloads/sshkit-1.25.0.gem"
    sha256 "c8c6543cdb60f91f1d277306d585dd11b6a064cb44eab0972827e4311ff96744"
  end

  resource "thor" do
    url "https://rubygems.org/downloads/thor-1.4.0.gem"
    sha256 "8763e822ccb0f1d7bee88cde131b19a65606657b847cc7b7b4b82e772bcd8a3d"
  end

  resource "tzinfo" do
    url "https://rubygems.org/downloads/tzinfo-2.0.6.gem"
    sha256 "8daf828cc77bcf7d63b0e3bdb6caa47e2272dcfaf4fbfe46f8c3a9df087a829b"
  end

  resource "uri" do
    url "https://rubygems.org/downloads/uri-1.1.1.gem"
    sha256 "379fa58d27ffb1387eaada68c749d1426738bd0f654d812fcc07e7568f5c57c6"
  end

  resource "zeitwerk" do
    url "https://rubygems.org/downloads/zeitwerk-2.7.4.gem"
    sha256 "2bef90f356bdafe9a6c2bd32bcd804f83a4f9b8bc27f3600fff051eb3edcec8b"
  end

  def install
    gem = Formula["ruby"].opt_bin/"gem"
    ENV["GEM_HOME"] = libexec
    ENV["GEM_PATH"] = libexec

    resources.each do |r|
      system gem, "install", r.cached_download, "--ignore-dependencies", "--no-document", "--install-dir", libexec
    end
    system gem, "install", cached_download, "--ignore-dependencies", "--no-document", "--install-dir", libexec

    bin.install libexec/"bin/kamal"
    bin.env_script_all_files libexec/"bin", GEM_HOME: libexec, GEM_PATH: libexec
  end

  test do
    system bin/"kamal", "version"
  end
end
