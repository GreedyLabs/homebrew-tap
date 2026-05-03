cask "usage4claude" do
  version "3.0.0"
  sha256 "81ba407aa78e430e99d454439e8b3fff964ab40f225bd7774ba70a48f56be2f2"

  url "https://github.com/f-is-h/Usage4Claude/releases/download/v#{version}/Usage4Claude-v#{version}.dmg"
  name "Usage4Claude"
  desc "Monitor your Claude AI 5-hour/7-day usage quota in real-time on the menubar"
  homepage "https://github.com/f-is-h/Usage4Claude"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "Usage4Claude.app"

  zap trash: [
    "~/Library/Application Scripts/xyz.fi5h.Usage4Claude",
    "~/Library/Containers/xyz.fi5h.Usage4Claude",
  ]

  caveats <<~EOS
    The application is not signed. Run

      xattr -r -d com.apple.quarantine /Applications/Usage4Claude.app

    with your own risk.
  EOS
end
