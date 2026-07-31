class Quoteforge < Formula
  desc "Developer-native typographic card, carousel, and banner generator"
  homepage "https://github.com/lordvins226/quoteforge"
  version "1.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lordvins226/quoteforge/releases/download/v#{version}/quoteforge-aarch64-apple-darwin.tar.gz"
      sha256 "6a2aa95d0e915fb36a9d00408b9a11fbabf0c6b5f5af287e79dc89a11f34edef"
    end
    on_intel do
      url "https://github.com/lordvins226/quoteforge/releases/download/v#{version}/quoteforge-x86_64-apple-darwin.tar.gz"
      sha256 "8ae8337113cd4372dc0f3f8b9c60cbd3794bbadd4e8ffbfe18c2774df9683e0d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lordvins226/quoteforge/releases/download/v#{version}/quoteforge-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "33ea6c96513963a22c2363be5a6ba5ec8f8dcaa8abf776233b21196d2dd20693"
    end
    on_intel do
      url "https://github.com/lordvins226/quoteforge/releases/download/v#{version}/quoteforge-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "be31cc446c3a45dad16105db3d064a7a830d3af0b2bc64a6bbe72dfed8de5f58"
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
