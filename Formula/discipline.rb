# typed: false
# frozen_string_literal: true

class Discipline < Formula
  desc "Universal CI/CD gatekeeper and AI coding agent diff sentinel"
  homepage "https://github.com/orieg/discipline"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.22.0/discipline-aarch64-apple-darwin.tar.gz"
      sha256 "26f1fa85b9427c5902fec1b6c10a220799ccdb39ae53d404dfd87dc7d0f27171"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.22.0/discipline-x86_64-apple-darwin.tar.gz"
      sha256 "8ee250becdcf04ddfefc03eb686808f66c42ef82c7aa09083103f74ea07da996"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.22.0/discipline-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9a54a3cc31af6c78d4aae4e6921789bbe9507036ea836ee2fb92db0cac7be2ff"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.22.0/discipline-x86_64-unknown-linux-musl.tar.gz"
      sha256 "22dbab4c6710c926f27759ba5cc2381f9252b3ca62967b77ad0b668b4d12cdc3"
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
