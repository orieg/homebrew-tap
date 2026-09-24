# typed: false
# frozen_string_literal: true

class Discipline < Formula
  desc "Universal CI/CD gatekeeper and AI coding agent diff sentinel"
  homepage "https://github.com/orieg/discipline"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.12.1/discipline-aarch64-apple-darwin.tar.gz"
      sha256 "8e9a07c5e50aed399c5ac519a49fd99e95b85985c325d3f65e42b190a5a832c7"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.12.1/discipline-x86_64-apple-darwin.tar.gz"
      sha256 "cbd5bc739a757cc8d3f3b5aae7837bc126a7b4d45d11bc71425d65b2c7e6c342"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.12.1/discipline-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4ccc537e9ab3071ffc38bb8633d72a6e6ecbddc63877228218fb1b9712752c17"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.12.1/discipline-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a064a2c0aad56dc1f6390ced675bb5e7402ada4b26eecb77b599cc2d1dc8aaa9"
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
