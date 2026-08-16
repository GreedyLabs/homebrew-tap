class GranterCli < Formula
  desc "Granter command-line tool"
  homepage "https://github.com/granter-biz"
  url "https://registry.npmjs.org/@granter-biz/cli/-/cli-0.6.1.tgz"
  sha256 "cd3f9e341baa044bb2749c86910db9acae455739244edaeff7d51b458acc6454"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/greedylabs/tap"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "c6587cdde823db56eb9e952a040310a388ba69eb18cbd715d447d2c9d96c2d58"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "acbea45eb23dcbdd07755a593460a2fb6af8a60febe66e1f8aa1f78a846841aa"
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
