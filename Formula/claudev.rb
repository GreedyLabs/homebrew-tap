class Claudev < Formula
  desc "Vertex AI wrapper for Claude Code"
  homepage "https://github.com/GreedyLabs/claudev"
  url "https://raw.githubusercontent.com/GreedyLabs/claudev/refs/tags/v0.1.1/claudev.sh"
  sha256 "650170729b076f57491d0261ba8fa2dbd149b80865d97e32bc753ecfa940cde9"
  license "MIT"

  def install
    inreplace "claudev.sh", "VERSION=dev", "VERSION=#{version}"
    bin.install "claudev.sh" => "claudev"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/claudev --version")
  end
end
