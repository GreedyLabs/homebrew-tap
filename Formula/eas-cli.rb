class EasCli < Formula
  desc "EAS command line tool"
  homepage "https://github.com/expo/eas-cli"
  url "https://registry.npmjs.org/eas-cli/-/eas-cli-18.0.1.tgz"
  sha256 "e41ac9a13c5ba383f4567c7716f00ed2bf80d97db99341b2bf051c2e42008b9b"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/eas --version")
  end
end
