class EasCli < Formula
  desc "EAS command-line tool"
  homepage "https://github.com/expo/eas-cli"
  url "https://registry.npmjs.org/eas-cli/-/eas-cli-20.1.0.tgz"
  sha256 "658c055798bc225fc08dc9338fa6dc83b6267381a6fe2f8cbf41018607b5d4e5"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/greedylabs/tap"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "d92f5608daacaf8ca0293d93e740e1db06c51355c384e23790cd6289c0d54f37"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b48618f1fb9ffab92bb5491fcb41f4e83e3853864f512d48fa90a6e7b0882fae"
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
