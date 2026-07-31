class Quoteforge < Formula
  desc "Developer-native typographic card, carousel, and banner generator"
  homepage "https://github.com/lordvins226/quoteforge"
  version "1.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lordvins226/quoteforge/releases/download/v#{version}/quoteforge-aarch64-apple-darwin.tar.gz"
      sha256 "29cc1da7487bcff53d2b5a8c67b32cd58f65c15afc5d583bbbbafb002af8249f"
    end
    on_intel do
      url "https://github.com/lordvins226/quoteforge/releases/download/v#{version}/quoteforge-x86_64-apple-darwin.tar.gz"
      sha256 "01d1c4bc40eb9ee0e76530fe7d7868ba04cda9646fb74c48915a56a321b0fb6a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lordvins226/quoteforge/releases/download/v#{version}/quoteforge-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fb2a8c402ae8887448105948747a98fa52d65ebeb102d3d6f1e30f4876db8cf1"
    end
    on_intel do
      url "https://github.com/lordvins226/quoteforge/releases/download/v#{version}/quoteforge-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d91a0f80850790ac170fda5b69837d827f0afcf438a9702c711145ad2404f6ef"
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
    assert_match version.to_s, shell_output("#{bin}/quoteforge --version")
  end
end
