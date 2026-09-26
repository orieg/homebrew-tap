# typed: false
# frozen_string_literal: true

class Discipline < Formula
  desc "Universal CI/CD gatekeeper and AI coding agent diff sentinel"
  homepage "https://github.com/orieg/discipline"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.14.0/discipline-aarch64-apple-darwin.tar.gz"
      sha256 "ab4c06763aa896b63447ba1bb6a3b9e8a99b48c51d731bc501ac568b8237b5b0"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.14.0/discipline-x86_64-apple-darwin.tar.gz"
      sha256 "406917700f5a19fa6bd2659bcb53a004a87f7daf1e7ee4b126d36ec8f9e3a12f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.14.0/discipline-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f431672c2b20bae6c3adeddf4ef45353101a757ee2d9b9c9bbf05e0f7ee9b7af"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.14.0/discipline-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c958a57bd1d1d3fe8913a4bd109240630f00a2c0ddbed4ce3c26ef05e497ef1e"
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
