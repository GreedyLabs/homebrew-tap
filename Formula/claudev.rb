class Claudev < Formula
  desc "Vertex AI wrapper for Claude Code"
  homepage "https://github.com/GreedyLabs/claudev"
  url "https://raw.githubusercontent.com/GreedyLabs/claudev/refs/heads/main/claudev.sh"
  version "0.1"
  sha256 "d2fbc90fdab8598267f67d71b77019410bab8d3e77bd454cf173c3c605bf9931"
  license "MIT"

  def install
    bin.install "claudev.sh" => "claudev"
  end

  def caveats
    <<~EOS
      This formula requires the `claude` binary and `gcloud` CLI.
      Please install it with:
        brew install claude-code google-cloud-sdk

      Also, ensure that you have authenticated with Google Cloud:
        gcloud auth login

      Then set up your project and authenticate application default credentials:
        gcloud config set project YOUR_PROJECT_ID
        gcloud auth application-default login

      Now you can use `claudev` to interact with Claude Code via Vertex AI.
    EOS
  end
end
