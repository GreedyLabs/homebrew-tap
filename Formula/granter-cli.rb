class GranterCli < Formula
  desc "Granter command-line tool"
  homepage "https://github.com/granter-biz"
  url "https://registry.npmjs.org/@granter-biz/cli/-/cli-0.1.4.tgz"
  sha256 "9fca666563d5180ab20be87b69e5a9319fd11f26969999338e2811abf3792074"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/greedylabs/tap"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "e4dcf16209109eea00a293571349705d4118f98bfa1fb92178bbd26c62eb57e4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d7b9a6abe7494765448565ac7972f0fbd9db0dc4a1893f452b7d2be7ddf21a77"
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
