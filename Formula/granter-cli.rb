class GranterCli < Formula
  desc "Granter command-line tool"
  homepage "https://github.com/granter-biz"
  url "https://registry.npmjs.org/@granter-biz/cli/-/cli-0.5.2.tgz"
  sha256 "9a761e0be9e570f623c2d40b6cf2a646ac569f50b783cfd139c70e4d0ef379ea"
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
