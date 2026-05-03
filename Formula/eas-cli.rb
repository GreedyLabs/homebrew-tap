class EasCli < Formula
  desc "EAS command-line tool"
  homepage "https://github.com/expo/eas-cli"
  url "https://registry.npmjs.org/eas-cli/-/eas-cli-18.9.1.tgz"
  sha256 "881e0bfdd3d8a6e7614024a3995828fc622a421f9e2666ae6c54ac98e135f733"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/greedylabs/tap"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "ca0e8e1191f1d94647c9ead03b93604ab372e1fbe62bd66358d2aeed01e26216"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e19125daed1c8ad973e7cf60c6b811827f0f90d5dd73a7e3100c1272717b8841"
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
