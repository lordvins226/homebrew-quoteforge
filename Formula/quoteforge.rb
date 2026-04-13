class Quoteforge < Formula
  desc "Developer-native typographic social media card and carousel generator"
  homepage "https://github.com/lordvins226/quoteforge"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lordvins226/quoteforge/releases/download/v#{version}/quoteforge-aarch64-apple-darwin.tar.gz"
      sha256 "7e2957ad6eaf6cbdd87380a48e47fefddcdabdc82c9a9d939d9e6dce948b3456"
    end
    on_intel do
      url "https://github.com/lordvins226/quoteforge/releases/download/v#{version}/quoteforge-x86_64-apple-darwin.tar.gz"
      sha256 "82041a2711357eb7b655c435d9e54cc1b9c0678d9988e68eb24fc8baa47a3069"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lordvins226/quoteforge/releases/download/v#{version}/quoteforge-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a722fe13809e5595f02543f3f9259f7d26e097dc218eead6c2b825cec6b87c05"
    end
    on_intel do
      url "https://github.com/lordvins226/quoteforge/releases/download/v#{version}/quoteforge-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "575f2958d92fb937a94b17a4bb51cb07286e6dc2f64d6788667c516c5915fa7c"
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
