# typed: false
# frozen_string_literal: true

class Discipline < Formula
  desc "Universal CI/CD gatekeeper and AI coding agent diff sentinel"
  homepage "https://github.com/orieg/discipline"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.26.0/discipline-aarch64-apple-darwin.tar.gz"
      sha256 "9ba1ee10ac985f08ea0df4d4f1e73d1c7f2c5d23e70d3943071682638650fa6a"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.26.0/discipline-x86_64-apple-darwin.tar.gz"
      sha256 "dec9476f3e83a3bd5fca7cf10db0a21e2a3a1104147d8af0e341c89c99babb3a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.26.0/discipline-aarch64-unknown-linux-musl.tar.gz"
      sha256 "cd9706cf98b4b8be998ee1888c9b8415884e2d4f23293d2e57235ada8f4143d3"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.26.0/discipline-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1024e80b42640a1b0a69b55a92bfae55cfdb6c525835133251da9627c2f9912b"
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
