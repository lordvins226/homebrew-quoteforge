class Quoteforge < Formula
  desc "Developer-native typographic card, carousel, and banner generator"
  homepage "https://github.com/lordvins226/quoteforge"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lordvins226/quoteforge/releases/download/v#{version}/quoteforge-aarch64-apple-darwin.tar.gz"
      sha256 "f8b9de66ecdc595f08aaae271cf8daa7e42d287e4fa28aeaee3ea7bac9142125"
    end
    on_intel do
      url "https://github.com/lordvins226/quoteforge/releases/download/v#{version}/quoteforge-x86_64-apple-darwin.tar.gz"
      sha256 "0a73758679d308ff08412736221c7d14d3c7231e6dc40943e6b7706549005903"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lordvins226/quoteforge/releases/download/v#{version}/quoteforge-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "76761a79bd4e4a85e8dc981a581c670dd11bc22bf2a1bf4867f972102e22a910"
    end
    on_intel do
      url "https://github.com/lordvins226/quoteforge/releases/download/v#{version}/quoteforge-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e4b04e7e99aa85b38aa4e57dbe8900677c8ac533dfa4a9ae1687f1f516377081"
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
