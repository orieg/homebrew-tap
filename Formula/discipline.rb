# typed: false
# frozen_string_literal: true

class Discipline < Formula
  desc "Universal CI/CD gatekeeper and AI coding agent diff sentinel"
  homepage "https://github.com/orieg/discipline"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.18.0/discipline-aarch64-apple-darwin.tar.gz"
      sha256 "1978f9745ff2d0b622a1d9235a131c4ae0267b3d610d2c8bf82b64f8c252cd91"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.18.0/discipline-x86_64-apple-darwin.tar.gz"
      sha256 "89e4d3bee3d27c8c384925b08fb9dc58c256a173ebac35cab4b21465edaf4f48"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.18.0/discipline-aarch64-unknown-linux-musl.tar.gz"
      sha256 "71ba43d452f5b58094784d2698aa92d8e3846eb4425da09dbcc734fa9b4b6203"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.18.0/discipline-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a1511157632a8018b1ff2c63579e1ccd52ad19f6aebc8aba502c40ea31c5dc09"
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
