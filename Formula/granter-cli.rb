class GranterCli < Formula
  desc "Granter command-line tool"
  homepage "https://github.com/granter-biz"
  url "https://registry.npmjs.org/@granter-biz/cli/-/cli-0.4.0.tgz"
  sha256 "5f5274fda9e4b842cfae85cd427deb0bef8a9790c35aae92527d7cf2e841c470"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/greedylabs/tap"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "19231ed430a4b7521280b104f94c93b620179d55000b1a9568210c623e7be151"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2bd095c1337ec4ec1ff8d36c56130dadd965ae7c352cd285e41d795eb38ab937"
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
