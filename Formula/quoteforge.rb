class Quoteforge < Formula
  desc "Developer-native typographic card, carousel, and banner generator"
  homepage "https://github.com/lordvins226/quoteforge"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lordvins226/quoteforge/releases/download/v#{version}/quoteforge-aarch64-apple-darwin.tar.gz"
      sha256 "7798e1987eb01cb072a7fc7bca89fe90171862f722ac9565fce8e483811e7a8c"
    end
    on_intel do
      url "https://github.com/lordvins226/quoteforge/releases/download/v#{version}/quoteforge-x86_64-apple-darwin.tar.gz"
      sha256 "60b6548b5cbb3ecbb0ffa94e00fbb6996f2d45f71ba347ff699e98f6d2ad9e62"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lordvins226/quoteforge/releases/download/v#{version}/quoteforge-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "586162606280722b1d23fb6dec9820a416dfe61ed6fd4d50c29655a2064d0584"
    end
    on_intel do
      url "https://github.com/lordvins226/quoteforge/releases/download/v#{version}/quoteforge-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1b20e907fa6b713fc9eb5e5f7bea6805febaa3cc4c4fdec38772b75bdd3e667c"
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
    assert_match "0.6.0", shell_output("#{bin}/quoteforge --version")
  end
end
