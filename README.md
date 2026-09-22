# Homebrew Tap for orieg

Official Homebrew tap for developer tools and libraries by [orieg](https://github.com/orieg).

## Installation

Add this tap to Homebrew:

```bash
brew tap orieg/tap
```

## Available Formulae

| Formula | Description | Installation |
|---|---|---|
| **`discipline`** | Universal CI/CD gatekeeper and AI coding agent diff sentinel | `brew install orieg/tap/discipline` |
| **`expanse`** | Judy-array digital tries in Rust, with a drop-in libjudy C ABI | `brew install orieg/tap/expanse` |

Or install directly in a single command:

```bash
brew install orieg/tap/discipline
brew install orieg/tap/expanse
```

### `expanse` and the stock `judy` formula

`expanse` installs `Judy.h` and a `libJudy` symlink pointing at `libexpanse`, so
`-lJudy` resolves to Expanse the way the Debian and RPM `libjudy-compat` packages
arrange it. It therefore conflicts with Homebrew's `judy` formula. If `judy` is
installed, unlink it first:

```bash
brew unlink judy
brew install orieg/tap/expanse
```

The `judy` keg stays in the Cellar and remains reachable at
`$(brew --prefix judy)` for side-by-side comparisons.

## Upgrading

```bash
brew update
brew upgrade discipline expanse
```

## How the formulae are maintained

Each formula is rendered and pushed by its project's release workflow at tag
time; `expanse.rb` is generated from
[`extra/homebrew/expanse.rb.in`](https://github.com/orieg/expanse/blob/main/extra/homebrew/expanse.rb.in).
Edit the template in the source repository, not the rendered formula here.

## License

MIT OR Apache-2.0
