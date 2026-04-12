class Quoteforge < Formula
  desc "Developer-native typographic social media card and carousel generator"
  homepage "https://github.com/lordvins226/quoteforge"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lordvins226/quoteforge/releases/download/v#{version}/quoteforge-aarch64-apple-darwin.tar.gz"
      sha256 "1f71ac271a4c9dddafd8c053aed2e95209491e3b72a4b0226696cc8a19483388"
    end
    on_intel do
      url "https://github.com/lordvins226/quoteforge/releases/download/v#{version}/quoteforge-x86_64-apple-darwin.tar.gz"
      sha256 "2ccb94262e37f4a74011da27c7dff38fbdfd56d234616295a2c9b780588366ca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lordvins226/quoteforge/releases/download/v#{version}/quoteforge-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d3c76a92e893a75c43fda9f955fc3b70a524b9459083ab0531c24d83f6899c21"
    end
    on_intel do
      url "https://github.com/lordvins226/quoteforge/releases/download/v#{version}/quoteforge-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7a8665520190d5197e63a560543e6eccd4428c8c6bf6109dc9e89e3d5f8e0333"
    end
  end

  def install
    bin.install "quoteforge"
  end

  def caveats
    <<~EOS
      QuoteForge renders via headless Chrome. On first run it will use your
      system Chrome/Chromium/Edge if available, otherwise it downloads a pinned
      Chrome for Testing (~170MB) to ~/.cache/quoteforge/chrome/.

      Override the browser with:
        export QUOTEFORGE_CHROME=/path/to/chrome

      Verify the install with:
        quoteforge doctor
    EOS
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/quoteforge --version")
  end
end
