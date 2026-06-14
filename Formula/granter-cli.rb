class GranterCli < Formula
  desc "Granter command-line tool"
  homepage "https://github.com/granter-biz"
  url "https://registry.npmjs.org/@granter-biz/cli/-/cli-0.5.1.tgz"
  sha256 "a708f903c505faa1cb2eb510d57afc4b9a40245a1f71d6821b00dcbcded60a3b"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/greedylabs/tap"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "96231cfce5e9a939918e987571596e65111d0cdb1f6f3226e62c8c906a019e80"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a5852970c4b63b2f63eb04ae2b257000f63361fb9930ab997bcc95cc33377d90"
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
