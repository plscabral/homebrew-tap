class TucanoProxy < Formula
  desc "Local HTTP(S) inspection for terminals, browsers and coding agents"
  homepage "https://github.com/plscabral/tucano-proxy"
  version "0.2.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/plscabral/tucano-proxy/releases/download/v0.2.10/tucano-proxy-aarch64-apple-darwin.tar.gz"
      sha256 "45d76e9f3c1f8ff94594f3050345cdc385bb810a77d43dd89eb45d13f5bb2a12"
    end
    on_intel do
      url "https://github.com/plscabral/tucano-proxy/releases/download/v0.2.10/tucano-proxy-x86_64-apple-darwin.tar.gz"
      sha256 "7555dc1a96b1fa6356238fd6368eeef489424f7799f0c5bc093e749d3bbe4643"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plscabral/tucano-proxy/releases/download/v0.2.10/tucano-proxy-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "52eb6c02b8ca2a79f6bfe2242116f19f72720ee13c1a3cc526238954c994aa35"
    end
    on_intel do
      url "https://github.com/plscabral/tucano-proxy/releases/download/v0.2.10/tucano-proxy-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b8555b389e2ab18d0749ea7c85bbc963c8b3f2595ebe3b220da4ded6264a537a"
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
