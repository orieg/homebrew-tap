# typed: false
# frozen_string_literal: true

class Discipline < Formula
  desc "Universal CI/CD gatekeeper and AI coding agent diff sentinel"
  homepage "https://github.com/orieg/discipline"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.15.0/discipline-aarch64-apple-darwin.tar.gz"
      sha256 "266a7c402fa8c4270f7aa01bb5b22d265f5296f1b7d2090bb15c4b07c4dbe036"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.15.0/discipline-x86_64-apple-darwin.tar.gz"
      sha256 "50207a3bd41cedbe9ac42c776b7cc11b792533dd6a909f1e0867ded14cdc314f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.15.0/discipline-aarch64-unknown-linux-musl.tar.gz"
      sha256 "cd958d81588bc2bf9a2ec455c851e18f40daeb521e4451640d46ac9b250e79c8"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.15.0/discipline-x86_64-unknown-linux-musl.tar.gz"
      sha256 "accd41dc4ee0f2c61a582a31dbccecf46923b605c0d928e3dcdc1d9173d1c3c4"
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
