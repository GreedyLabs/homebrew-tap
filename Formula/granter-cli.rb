class GranterCli < Formula
  desc "Granter command-line tool"
  homepage "https://github.com/granter-biz"
  url "https://registry.npmjs.org/@granter-biz/cli/-/cli-0.2.0.tgz"
  sha256 "7baaa36a03e5fced92a93733f8cccd83843a291aac3fbe47ac4e620c5772b23d"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/greedylabs/tap"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "28f846c579d5b96fa2e1396709489d43815b6f64d54c188dcbc4aaf7d1d77ec1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "46b4c4b660ae3133f41b6fd1fa85082ed007f80843fe5b1b3dce388a3679a7df"
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
