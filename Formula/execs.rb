class Execs < Formula
  desc "Execute shell command on the ECS Fargate"
  homepage "https://github.com/daeho-ro/execs"
  url "https://github.com/daeho-ro/execs/archive/refs/tags/v0.1.9.tar.gz"
  sha256 "51103c12012721497940f082f706ff71ec020072172e56e41a8aa65a5c5a8705"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/greedylabs/tap"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "8874bacedb2afe5c6cc89b333d5826709081812ef01131b1bcd2cb8bbfced39e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d8b1a428c752513611a2dd288ed7843a19fdcaaf23d8bd8707a401e838da2522"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end

  test do
    assert_match "Failed to get the regions", shell_output("#{bin}/execs 2>&1", 1)
  end
end
