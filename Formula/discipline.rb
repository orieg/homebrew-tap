# typed: false
# frozen_string_literal: true

class Discipline < Formula
  desc "Universal CI/CD gatekeeper and AI coding agent diff sentinel"
  homepage "https://github.com/orieg/discipline"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.10.0/discipline-aarch64-apple-darwin.tar.gz"
      sha256 "3dca0bb9a0a0f4a2320f70e2e714f30f1d94237b0050cf726edcefb2ba8b7dbb"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.10.0/discipline-x86_64-apple-darwin.tar.gz"
      sha256 "2e70c8a234f8528cf4242c94e0abd4ec4734a0600bc4945cfdd37922ae26615a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.10.0/discipline-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a7ba7beccb84f04e3f53e3996795c45ae40331907fe2a0e166e71945c14333cf"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.10.0/discipline-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b61f0cbd0535083bfdcc1c6f3882927c82fb047893e3f847f7aa7ad2d6c358d9"
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
