# typed: false
# frozen_string_literal: true

class Discipline < Formula
  desc "Universal CI/CD gatekeeper and AI coding agent diff sentinel"
  homepage "https://github.com/orieg/discipline"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.20.3/discipline-aarch64-apple-darwin.tar.gz"
      sha256 "647c4c00a19e8469e382f5bc92e3438414dce992e72e0e999d22fad3f768b9c0"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.20.3/discipline-x86_64-apple-darwin.tar.gz"
      sha256 "ee91865cc7631ba77a81d679753340780ffc1551a5224d782c79728c9b18519b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.20.3/discipline-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a97d3ba65f602147549232cf5b6a8b131a9748ce55d270002f2def0a77e9aa26"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.20.3/discipline-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ef606ccc8ece18586813c1b25831cec4af3b33c3baa03daa3b5d721135107dea"
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
