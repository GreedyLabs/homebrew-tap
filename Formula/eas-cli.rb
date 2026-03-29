class EasCli < Formula
  desc "EAS command-line tool"
  homepage "https://github.com/expo/eas-cli"
  url "https://registry.npmjs.org/eas-cli/-/eas-cli-18.4.0.tgz"
  sha256 "b234745eed9244acbc46880aa51bce0229ea7b2bc9d42c2285b5c53911ad4f55"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/greedylabs/tap"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "18fcdc6b29b1c89d56d36f97ac4aed7549f81a61f7778e46d833ea1abf1cc487"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9b2ae3743a54231703572e0d345d04b7bd82378ff7a59fbc3f3f5a7dc7013303"
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/eas --version")
  end
end
