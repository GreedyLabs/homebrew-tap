class EasCli < Formula
  desc "EAS command-line tool"
  homepage "https://github.com/expo/eas-cli"
  url "https://registry.npmjs.org/eas-cli/-/eas-cli-18.5.0.tgz"
  sha256 "b7fba66a554d0bc3f7c021fea1c4ec77fdfe92bcb27e6293d63b99890eecc10f"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/greedylabs/tap"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "61ae83907bb8346f24d97b11d785c53ea8c62bd2afe3baa38b20e5201c355ae1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4b199e149f2deda79a5dce6ce70e9bc2f98a14613da912d10b96de52185301b5"
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
