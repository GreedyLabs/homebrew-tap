cask "usage4claude" do
  version "3.3.0"
  sha256 "5d12b05042cfdb804d04aae4ce5bd8c94986e78cbf955f1daee5e16c21eab834"

  url "https://github.com/f-is-h/Usage4Claude/releases/download/v#{version}/Usage4Claude-v#{version}.dmg"
  name "Usage4Claude"
  desc "Monitor your Claude AI 5-hour/7-day usage quota in real-time on the menubar"
  homepage "https://github.com/f-is-h/Usage4Claude"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

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
