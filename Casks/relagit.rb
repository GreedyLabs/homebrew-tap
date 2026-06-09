cask "relagit" do
  arch arm: "arm64", intel: "x64"

  version "0.16.11"
  sha256 arm:   "8e1e86ddc2679e0b03500380a5729f097ac7252b2d4eb7324d1e9d91fb6a3f66",
         intel: "57efb58a7ab46d6566eb8769438a75655db372eed5a55ada661ecb6e0ce56c4c"

  url "https://github.com/relagit/relagit/releases/download/v#{version}/RelaGit-mac-#{arch}.dmg",
      verified: "github.com/relagit/relagit/"
  name "RelaGit"
  desc "Elegant solution to graphical version control"
  homepage "https://rela.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "RelaGit.app"

  zap trash: [
    "~/.relagit",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.relagit.app.sfl*",
    "~/Library/Application Support/relagit",
    "~/Library/Preferences/com.relagit.app.plist",
  ]

  caveats <<~EOS
    The application is not signed. Run

      xattr -r -d com.apple.quarantine /Applications/RelaGit.app

    with your own risk.
  EOS
end
