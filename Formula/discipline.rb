# typed: false
# frozen_string_literal: true

class Discipline < Formula
  desc "Universal CI/CD gatekeeper and AI coding agent diff sentinel"
  homepage "https://github.com/orieg/discipline"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.20.0/discipline-aarch64-apple-darwin.tar.gz"
      sha256 "dd33fe76f5b07d244ae6c0a28768f913dd1ec07e4798543e0b26d52de846972d"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.20.0/discipline-x86_64-apple-darwin.tar.gz"
      sha256 "3f6a35bf0f4f1f9171905b95ff484295189da09dc900bd1a6a58600394bf4b8d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.20.0/discipline-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c3f8d5f63027a81b3a251cb760e5277e5f930d874c80393b5a50546954cc5119"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.20.0/discipline-x86_64-unknown-linux-musl.tar.gz"
      sha256 "5ea8235ec1cefd7408665beb10c64db1d4fe08fda9f474a4839ebe2d83f55a4d"
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
