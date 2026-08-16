cask "claude-usage-tracker" do
  version "3.2.0"
  sha256 "968c03e54a80beeb0c4395cf56db9e8ee9925d35eb9dcda8c639032dba8efb5f"

  url "https://github.com/hamed-elfayome/Claude-Usage-Tracker/releases/download/v#{version}/Claude-Usage.zip"
  name "Claude Usage Tracker"
  desc "Native menu bar app for tracking Claude AI usage limits in real-time"
  homepage "https://github.com/hamed-elfayome/Claude-Usage-Tracker"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Claude Usage.app"

  zap trash: [
    "~/Library/Caches/HamedElfayome.Claude-Usage",
    "~/Library/HTTPStorages/HamedElfayome.Claude-Usage",
    "~/Library/HTTPStorages/HamedElfayome.Claude-Usage.binarycookies",
    "~/Library/Preferences/HamedElfayome.Claude-Usage.plist",
    "~/Library/WebKit/HamedElfayome.Claude-Usage",
  ]
end
