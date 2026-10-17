# typed: false
# frozen_string_literal: true

class Discipline < Formula
  desc "Universal CI/CD gatekeeper and AI coding agent diff sentinel"
  homepage "https://github.com/orieg/discipline"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.23.0/discipline-aarch64-apple-darwin.tar.gz"
      sha256 "c2c09b2b8c5e7494ceaa1042aa1c6b05d95c149eb3a2570e6715711c269a3484"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.23.0/discipline-x86_64-apple-darwin.tar.gz"
      sha256 "0152760a2d38c373a90d9ef665b51b466489f4c65ded3daca4796d165b8a38d1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.23.0/discipline-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8198fd6d8cd0d8af831beb79c75ad86652435d8c80d9d82be2c04f0e95876b8e"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.23.0/discipline-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f7f3aaf8de67e2a3477dcb64a2f6beb68ef3f2cb20ed85f5a72a04e3a8bc2d55"
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
