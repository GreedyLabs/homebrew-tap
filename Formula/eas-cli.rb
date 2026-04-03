class EasCli < Formula
  desc "EAS command-line tool"
  homepage "https://github.com/expo/eas-cli"
  url "https://registry.npmjs.org/eas-cli/-/eas-cli-18.5.0.tgz"
  sha256 "b7fba66a554d0bc3f7c021fea1c4ec77fdfe92bcb27e6293d63b99890eecc10f"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/greedylabs/tap"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "0f7ee55a347af338db22afea773d7bcacfbb9592af40a4c387c9b5d5db573a2b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b19ec46d97c87405b0c8d140980dae291217da01da34a930f0d2ecc8d9403b2c"
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
