class EasCli < Formula
  desc "EAS command-line tool"
  homepage "https://github.com/expo/eas-cli"
  url "https://registry.npmjs.org/eas-cli/-/eas-cli-18.6.0.tgz"
  sha256 "8026c83fa2915a3b551ca071e8865c28c752bf76e46b90787226320ba5685ee6"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/greedylabs/tap"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "6642b202bece2ec68a780882e2e84533f24a7a1b8045cc59fcd979510dde3d1f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "10b9bdcdc794029e8275409946437da0709840d11399ec1c778bb2f49ee0a83c"
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
