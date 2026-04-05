class WhaleReaper < Formula
  desc "Monitor and cut the CPU usage of Whale Helper"
  homepage "https://github.com/daeho-ro/whale-reaper"
  url "https://github.com/daeho-ro/whale-reaper/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "6efdfd745c0a29d585f5347f78ce9ebb6349687ffe1005053d4872eb2304ea16"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/greedylabs/tap"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "6e3d9891ce298bb9863ad18e3e2cdebc7c5d2b419909960eb93ce4abba5dd38d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6fb5b4d0936b3aac9a44d47d43780c927c23fe59447cfee031b06d2cdd35353b"
  end

  def install
    bin.install "main.sh" => "whale-reaper"

    config = pkgetc/"config"
    config.write <<~EOS unless config.exist?
      WHALE_CPU_THRESHOLD=20
    EOS

    (var/"log/whale-reaper").mkpath
  end

  service do
    run [opt_bin/"whale-reaper"]
    run_type :interval
    interval 600
    log_path var/"log/whale-reaper/info.log"
    error_log_path var/"log/whale-reaper/err.log"
  end

  test do
    assert_match "자동 종료 스크립트", shell_output("cat #{bin}/whale-reaper")
  end
end
