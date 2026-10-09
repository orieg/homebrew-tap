# typed: false
# frozen_string_literal: true

class Discipline < Formula
  desc "Universal CI/CD gatekeeper and AI coding agent diff sentinel"
  homepage "https://github.com/orieg/discipline"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.19.0/discipline-aarch64-apple-darwin.tar.gz"
      sha256 "f1ed3e3d700e6150a113ec102400b9d00d9a76ec4042b59dfb1c0397f923eb2c"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.19.0/discipline-x86_64-apple-darwin.tar.gz"
      sha256 "380d561eaafdc381afaeac7a50895d0d109d9b29118767b9c974d8288c2fd3a5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.19.0/discipline-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3ade4406b80151482573fb4222a22897ce05107afd2f14e69ab57550b88d485a"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.19.0/discipline-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a4b15c1e89340a6df895e26917ffbd89acf838cd29b675eb736e959d2e0a296e"
    end
  end

  def install
    bin.install "discipline"
    man1.install "man/man1/discipline.1" if File.exist?("man/man1/discipline.1")
    man5.install "man/man5/discipline.toml.5" if File.exist?("man/man5/discipline.toml.5")
    generate_completions_from_executable(bin/"discipline", "completions")
  end

  test do
    assert_match "discipline #{version}", shell_output("#{bin}/discipline --version")
  end
end
