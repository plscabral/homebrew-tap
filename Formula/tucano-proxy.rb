class TucanoProxy < Formula
  desc "Local HTTP(S) inspection for terminals, browsers and coding agents"
  homepage "https://github.com/plscabral/tucano-proxy"
  version "0.2.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/plscabral/tucano-proxy/releases/download/v0.2.9/tucano-proxy-aarch64-apple-darwin.tar.gz"
      sha256 "63da752c3f51c846339997bea751ffa4d76afb1f9d95d749a876e4ec55125771"
    end
    on_intel do
      url "https://github.com/plscabral/tucano-proxy/releases/download/v0.2.9/tucano-proxy-x86_64-apple-darwin.tar.gz"
      sha256 "f3ce1160596541a9adde790560160a566f94187954e634bd1b49f3071791dc88"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plscabral/tucano-proxy/releases/download/v0.2.9/tucano-proxy-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bc760646408f31df4cc8ea24d139fe4ac2d6faf2404ede1344dc99fdcbb38250"
    end
    on_intel do
      url "https://github.com/plscabral/tucano-proxy/releases/download/v0.2.9/tucano-proxy-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1cb0eee44e7f64bb5bd035b2f61fc4ff00b220f0b62eee8144de92541699504b"
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
