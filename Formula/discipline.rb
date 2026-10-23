# typed: false
# frozen_string_literal: true

class Discipline < Formula
  desc "Universal CI/CD gatekeeper and AI coding agent diff sentinel"
  homepage "https://github.com/orieg/discipline"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.25.2/discipline-aarch64-apple-darwin.tar.gz"
      sha256 "fc31bd869c07f5e8224fb923f5c2c6ef345c1656e311f33273dd656ede4061e6"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.25.2/discipline-x86_64-apple-darwin.tar.gz"
      sha256 "144c803ca689e5f1cb3728e18add129f376e2efbb1c75ae219e7a96f46d3b7cb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.25.2/discipline-aarch64-unknown-linux-musl.tar.gz"
      sha256 "40de2a10365a4ce6362312d2a62e348a07c1fd2e98183d13779ba5fad07f586d"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.25.2/discipline-x86_64-unknown-linux-musl.tar.gz"
      sha256 "14a28868cfe2cd24820b9b085c8424fa471b0b555575525951f8d429302e2804"
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
