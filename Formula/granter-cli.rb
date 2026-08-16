class GranterCli < Formula
  desc "Granter command-line tool"
  homepage "https://github.com/granter-biz"
  url "https://registry.npmjs.org/@granter-biz/cli/-/cli-0.6.1.tgz"
  sha256 "cd3f9e341baa044bb2749c86910db9acae455739244edaeff7d51b458acc6454"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/greedylabs/tap"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "9395971f42b724d676d2880a954ce5e232ffdd84bee8e2a6edb08e77cdc984ce"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "72af6a11a802865d81a0fe9d8d9e49179124f1bcdca01e54a07929456c2eb5be"
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system bin/"granter", "config", "--api-key", "test"
    assert_match "유효하지 않은 API key이거나 권한이 없습니다.", shell_output("#{bin}/granter tags 2>&1", 1)
  end
end
