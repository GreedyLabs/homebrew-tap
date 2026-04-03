class WhaleReaper < Formula
  desc "Monitor and cut the CPU usage of Whale Helper"
  homepage "https://github.com/daeho-ro/whale-reaper"
  url "https://github.com/daeho-ro/whale-reaper/archive/refs/tags/v0.1.tar.gz"
  sha256 "047c0771150ba61aaff3e1a00ebe448dc1ab0fc6936134c470244bd8a36bc850"
  license "MIT"

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
