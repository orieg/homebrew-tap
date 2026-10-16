# typed: false
# frozen_string_literal: true

class Discipline < Formula
  desc "Universal CI/CD gatekeeper and AI coding agent diff sentinel"
  homepage "https://github.com/orieg/discipline"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.21.2/discipline-aarch64-apple-darwin.tar.gz"
      sha256 "2e8ef9cfa8eabf4b590e0d0f51bc228c1a14441ec6f156172b1c764e7ae3a42b"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.21.2/discipline-x86_64-apple-darwin.tar.gz"
      sha256 "4d4c27eb54424e6bdc424ec32588bb81da2614f99d18ebedc4f8a92d0b23d60a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.21.2/discipline-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f2a3bbaa2c32e80a5522ff4b9e3ae4afb7e5a9681339c5c4c31d5cd4a1b31178"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.21.2/discipline-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6a16ce9b5e03c01a11e4203af43b560ccc4d6f1611db16c369a4b72b6f8ff77d"
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
