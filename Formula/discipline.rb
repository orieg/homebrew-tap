# typed: false
# frozen_string_literal: true

class Discipline < Formula
  desc "Universal CI/CD gatekeeper and AI coding agent diff sentinel"
  homepage "https://github.com/orieg/discipline"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.14.3/discipline-aarch64-apple-darwin.tar.gz"
      sha256 "525a5fee8891f67510ad17e3e167fb5e86b897385df047c374c4ed6161d70a83"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.14.3/discipline-x86_64-apple-darwin.tar.gz"
      sha256 "a1b9ba8e628fec22cf7eb0c6b59948104a3b0bf612c4c2ba4c93a667c3d379f1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.14.3/discipline-aarch64-unknown-linux-musl.tar.gz"
      sha256 "488f549ec00ef663a15225877a9ad9eed6233772aba1a2cec4c6133c9e6c065f"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.14.3/discipline-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ea20cd0b90ef5c5bec3b818c05b4b498ce86f4282197d9c3c4efc2460c35e59c"
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
