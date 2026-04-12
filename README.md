# homebrew-quoteforge

Official Homebrew tap for [QuoteForge](https://github.com/lordvins226/quoteforge).

## Install

```bash
brew install lordvins226/quoteforge/quoteforge
```

Or tap first, then install:

```bash
brew tap lordvins226/quoteforge
brew install quoteforge
```

## Verify

```bash
quoteforge --version
quoteforge doctor
```

## Notes

QuoteForge renders via headless Chrome. On first run it uses your system
Chrome/Chromium/Edge if available, otherwise downloads a pinned Chrome for
Testing (~170MB) to `~/.cache/quoteforge/chrome/`. Override with
`QUOTEFORGE_CHROME=/path/to/chrome`.

## Updates

The formula is auto-bumped by the `homebrew-bump` workflow in the main
[quoteforge](https://github.com/lordvins226/quoteforge) repo each time a new
release publishes.
