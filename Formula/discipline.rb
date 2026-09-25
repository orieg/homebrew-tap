# typed: false
# frozen_string_literal: true

class Discipline < Formula
  desc "Universal CI/CD gatekeeper and AI coding agent diff sentinel"
  homepage "https://github.com/orieg/discipline"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.13.0/discipline-aarch64-apple-darwin.tar.gz"
      sha256 "12a446c748c993b7ff735bd94f80f37c3d0bba94082bfe1003c0ed92dfea65c1"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.13.0/discipline-x86_64-apple-darwin.tar.gz"
      sha256 "f39ef4a6ca5e2fcc96b93289aa99c3d63206ef6bd91127f1bcd80f0eebc62c5c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.13.0/discipline-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a275e375c9c20cc3b7e29db0f77405b1ce24b9d15e345b91ef5a93fe4fba88e3"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.13.0/discipline-x86_64-unknown-linux-musl.tar.gz"
      sha256 "805a4eb43e2ac9efe255b850b28981ab6cd81a67a775a4903051c8600be3aa74"
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
