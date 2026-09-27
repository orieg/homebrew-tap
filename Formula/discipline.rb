# typed: false
# frozen_string_literal: true

class Discipline < Formula
  desc "Universal CI/CD gatekeeper and AI coding agent diff sentinel"
  homepage "https://github.com/orieg/discipline"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.14.1/discipline-aarch64-apple-darwin.tar.gz"
      sha256 "17e47e271707cb8b6fcd965b1c8661a215c4007c722ec0f71c4bfdbfb26d7f1b"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.14.1/discipline-x86_64-apple-darwin.tar.gz"
      sha256 "06b39c54a084233406d4e749817734d49956d9c9b84a0aec6791cfedd4dedc78"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.14.1/discipline-aarch64-unknown-linux-musl.tar.gz"
      sha256 "750c2dd5fc34871e3a9108748be45e47bcfc04fada03e5a31417615dfc2c5788"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.14.1/discipline-x86_64-unknown-linux-musl.tar.gz"
      sha256 "605e685bc81b0d58f262551644ce2ad843d3669cc15c1b305a821f998453efa2"
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
