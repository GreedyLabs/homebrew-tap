class GranterCli < Formula
  desc "Granter command-line tool"
  homepage "https://github.com/granter-biz"
  url "https://registry.npmjs.org/@granter-biz/cli/-/cli-0.2.0.tgz"
  sha256 "7baaa36a03e5fced92a93733f8cccd83843a291aac3fbe47ac4e620c5772b23d"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/greedylabs/tap"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "8516ea7a57fd84cece8dbf9b10c47aae74612623a422fac0a5ae38552bf67c43"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "61acb043710b895f762e3a0330f7dc52af4cf2bac283ff6acfc36e5b9c37ede1"
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
