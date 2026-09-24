# typed: false
# frozen_string_literal: true

class Discipline < Formula
  desc "Universal CI/CD gatekeeper and AI coding agent diff sentinel"
  homepage "https://github.com/orieg/discipline"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.12.0/discipline-aarch64-apple-darwin.tar.gz"
      sha256 "d733ce7f636a91fdfbb10b85bb3672507fa0c1d3f132832b947d7c943fa6f725"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.12.0/discipline-x86_64-apple-darwin.tar.gz"
      sha256 "e576cae6cd530118a61d67bdd6eea4ccffa1a8fe7b1d2fa2d2b3b318adf7d9fc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.12.0/discipline-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9edac9c992b01309b8c1a7f57b8153ff3bb4dbfcf8807835fe66770d2f2cab1f"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.12.0/discipline-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d393ac5e43324dffb50e36d94ee0ef0beae3c1baa8cd97a13e187c021e72366a"
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
