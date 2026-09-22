# typed: false
# frozen_string_literal: true

class Discipline < Formula
  desc "Universal CI/CD gatekeeper and AI coding agent diff sentinel"
  homepage "https://github.com/orieg/discipline"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.8.0/discipline-aarch64-apple-darwin.tar.gz"
      sha256 "895cc61e0919d1a167cae4596f59f4e5ea10e658dea00c034cbbb9add2603ffa"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.8.0/discipline-x86_64-apple-darwin.tar.gz"
      sha256 "3b3466ac15d73e9f8f533c684e1812998f89a84fd500576311695370b435df7c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.8.0/discipline-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f7052a7a07e3fca3500bad078d38ca7206637e2981f4e65a1a7379c8c4873b43"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.8.0/discipline-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f4e6501c2f33a21d165d7e075530c25c82911a45e2327d4b84c65978b7437f5f"
    end
  end

  def install
    bin.install "discipline"
    man1.install "man/man1/discipline.1" if File.exist?("man/man1/discipline.1")
    man5.install "man/man5/discipline.toml.5" if File.exist?("man/man5/discipline.toml.5")
  end

  test do
    assert_match "discipline #{version}", shell_output("#{bin}/discipline --version")
  end
end
