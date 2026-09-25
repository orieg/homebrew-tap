# typed: false
# frozen_string_literal: true

class Discipline < Formula
  desc "Universal CI/CD gatekeeper and AI coding agent diff sentinel"
  homepage "https://github.com/orieg/discipline"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.12.2/discipline-aarch64-apple-darwin.tar.gz"
      sha256 "cbcea8ae24463978d541a33922b5d4f1785d8858c126fbe87803c5783a92434b"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.12.2/discipline-x86_64-apple-darwin.tar.gz"
      sha256 "882a8558e3a218827bdfa177b82a9a1a7e660e6f1d703b41e25224aa83bdeb12"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.12.2/discipline-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6c3ad078ad26f989f773b12cf0f550b754d0a407b24f863f1b9dedec50bc58f6"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.12.2/discipline-x86_64-unknown-linux-musl.tar.gz"
      sha256 "80179f002763e39511d04354add06527b8244b78d98740a170af4eb6e3bec2ac"
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
