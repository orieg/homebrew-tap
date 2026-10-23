# typed: false
# frozen_string_literal: true

class Discipline < Formula
  desc "Universal CI/CD gatekeeper and AI coding agent diff sentinel"
  homepage "https://github.com/orieg/discipline"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.25.1/discipline-aarch64-apple-darwin.tar.gz"
      sha256 "c87d05b25a7731bfbd67b1056b75eb70be69c2ad01d49b9f5af59a4440c21d63"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.25.1/discipline-x86_64-apple-darwin.tar.gz"
      sha256 "034b6f17f40ceef2e002cdd9e8b00f604e7a1c4c5225751abe52bfd5fae4b0ef"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.25.1/discipline-aarch64-unknown-linux-musl.tar.gz"
      sha256 "fbedb71b74eeae9a3748362b99f0953738d6e1a0e583aa990e689d5780865c7a"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.25.1/discipline-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8cf64c76cae4244d97eab36de93fe429fdd118637931de44735116175eba8da1"
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
