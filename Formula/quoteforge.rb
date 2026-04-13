class Quoteforge < Formula
  desc "Developer-native typographic social media card and carousel generator"
  homepage "https://github.com/lordvins226/quoteforge"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lordvins226/quoteforge/releases/download/v#{version}/quoteforge-aarch64-apple-darwin.tar.gz"
      sha256 "b4290f261571aa56ab57ccf3c0e5249644a26861e29fe28d26e519b5e7c15eca"
    end
    on_intel do
      url "https://github.com/lordvins226/quoteforge/releases/download/v#{version}/quoteforge-x86_64-apple-darwin.tar.gz"
      sha256 "8cb26fd19eb006406253dd7e82d519f215a0d93e286c75242a5f2054bda1b895"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lordvins226/quoteforge/releases/download/v#{version}/quoteforge-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f5f02165dc95e8c8fe9a2ca9463da4bb8c192f7403113c1c400dfa7108c5fe36"
    end
    on_intel do
      url "https://github.com/lordvins226/quoteforge/releases/download/v#{version}/quoteforge-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fbd7ee0003904a22b755d26e729d901f53287cac4abf0ebec3d9c01513cf0c25"
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
