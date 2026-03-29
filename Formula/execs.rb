class Execs < Formula
  desc "Execute shell command on the ECS Fargate"
  homepage "https://github.com/daeho-ro/execs"
  url "https://github.com/daeho-ro/execs/archive/refs/tags/v0.1.9.tar.gz"
  sha256 "51103c12012721497940f082f706ff71ec020072172e56e41a8aa65a5c5a8705"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end

  test do
    assert_match "Failed to get the regions", shell_output("#{bin}/execs 2>&1", 1)
  end
end
