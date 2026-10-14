# typed: false
# frozen_string_literal: true

class Discipline < Formula
  desc "Universal CI/CD gatekeeper and AI coding agent diff sentinel"
  homepage "https://github.com/orieg/discipline"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.20.2/discipline-aarch64-apple-darwin.tar.gz"
      sha256 "cca59952ac34d478816cf6e852fc9745560417e26da9fe35bd1ae3cf0d880475"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.20.2/discipline-x86_64-apple-darwin.tar.gz"
      sha256 "4b101fbee92f9c44c49e775881627186d51bf4044eba9be61c3de37dc364a30f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.20.2/discipline-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9d0afc4e2c9dedcf305b93f5a0baf865b0933b6e3383a83c7eec57572d896b4a"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.20.2/discipline-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b59206b39f01a11bfbfea174d9d33df6717b1345106fe90f14c18f364343780c"
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
