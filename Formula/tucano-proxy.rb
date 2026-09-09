class TucanoProxy < Formula
  desc "Local HTTP(S) inspection for terminals, browsers and coding agents"
  homepage "https://github.com/plscabral/tucano-proxy"
  version "0.2.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/plscabral/tucano-proxy/releases/download/v0.2.8/tucano-proxy-aarch64-apple-darwin.tar.gz"
      sha256 "10292f7add8847879139f28487565395db2188442230f5190429c4bb8c055515"
    end
    on_intel do
      url "https://github.com/plscabral/tucano-proxy/releases/download/v0.2.8/tucano-proxy-x86_64-apple-darwin.tar.gz"
      sha256 "ba9cf5ac6c26069403d9bcf21dc69247a623f8eb9613f85851d81ad97ca69440"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plscabral/tucano-proxy/releases/download/v0.2.8/tucano-proxy-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a7fa2a9d313f632f8dc78e0fdd16495a86769362c230e3adf22985b8147dde67"
    end
    on_intel do
      url "https://github.com/plscabral/tucano-proxy/releases/download/v0.2.8/tucano-proxy-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "024ed6a4c9e515846fe51ff9e6afaa37b3c8bfc757d030fb887524a39ae470aa"
    end
  end

  def install
    bin.install "tucano-proxy"
    (bin/".tucano-proxy-install.json").write '{"channel":"homebrew","package":"plscabral/tap/tucano-proxy"}'
    generate_completions_from_executable(bin/"tucano-proxy", "completions")
  end

  test do
    assert_equal "tucano-proxy #{version}", shell_output("#{bin}/tucano-proxy --version").strip
  end
end
