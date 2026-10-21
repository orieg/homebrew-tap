# typed: false
# frozen_string_literal: true

class Discipline < Formula
  desc "Universal CI/CD gatekeeper and AI coding agent diff sentinel"
  homepage "https://github.com/orieg/discipline"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.24.0/discipline-aarch64-apple-darwin.tar.gz"
      sha256 "de7ff7e1937f7342c24c6c7b3ced4f34ffadea52a3bea2e4689bf8ea3b08be7a"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.24.0/discipline-x86_64-apple-darwin.tar.gz"
      sha256 "dc11c00d426d86634077aac9b24ebfadbf2c34b75ec8b0ef57e4aaa3968259a7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.24.0/discipline-aarch64-unknown-linux-musl.tar.gz"
      sha256 "89a85b098a186066c608eb981998291cb0054972814a0fcbb09ab5c8a0ac2841"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.24.0/discipline-x86_64-unknown-linux-musl.tar.gz"
      sha256 "80ab6c30f26e022b8d9bacf752d52b6480e2e39de47741b9a471d3ff1ede931d"
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
