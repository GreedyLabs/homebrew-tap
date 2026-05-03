class EasCli < Formula
  desc "EAS command-line tool"
  homepage "https://github.com/expo/eas-cli"
  url "https://registry.npmjs.org/eas-cli/-/eas-cli-18.9.1.tgz"
  sha256 "881e0bfdd3d8a6e7614024a3995828fc622a421f9e2666ae6c54ac98e135f733"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/greedylabs/tap"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "9c7322deb8a032a982328dd65670613de92015e25ed46ed4ccfe1d6c852d355a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e96f7f15d46c6200138ed9508bc0854cbde8672c8bf4e6c143a51626fb15a352"
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
