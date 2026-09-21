# typed: false
# frozen_string_literal: true

class Discipline < Formula
  desc "Universal CI/CD gatekeeper and AI coding agent diff sentinel"
  homepage "https://github.com/orieg/discipline"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.7.1/discipline-aarch64-apple-darwin.tar.gz"
      sha256 "95db9dfd97dd4b1e8b0f63849ba69928b386f025c97509fcfbb37a42ff2c3c3b"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.7.1/discipline-x86_64-apple-darwin.tar.gz"
      sha256 "988c1a66f5c48f9f80a0c07a228a51f275f2b7660b68670167f165323bd941b9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.7.1/discipline-aarch64-unknown-linux-musl.tar.gz"
      sha256 "559ab04ec55133662ed8046df540a8126b13ddc49e655353832b6c5f323dabd9"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.7.1/discipline-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c5b3a3ec348f261a79602d75b7f9ce9d6dfc321c1d72550674034720812d2952"
    end
  end

  def install
    bin.install "discipline"
    man1.install "man/man1/discipline.1" if File.exist?("man/man1/discipline.1")
    man5.install "man/man5/discipline.toml.5" if File.exist?("man/man5/discipline.toml.5")
  end

  test do
    assert_match "discipline #{version}", shell_output("#{bin}/discipline --version")
  end
end
