class EasCli < Formula
  desc "EAS command-line tool"
  homepage "https://github.com/expo/eas-cli"
  url "https://registry.npmjs.org/eas-cli/-/eas-cli-18.0.1.tgz"
  sha256 "e41ac9a13c5ba383f4567c7716f00ed2bf80d97db99341b2bf051c2e42008b9b"
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
