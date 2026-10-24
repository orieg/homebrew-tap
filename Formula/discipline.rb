# typed: false
# frozen_string_literal: true

class Discipline < Formula
  desc "Universal CI/CD gatekeeper and AI coding agent diff sentinel"
  homepage "https://github.com/orieg/discipline"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.25.3/discipline-aarch64-apple-darwin.tar.gz"
      sha256 "ad3f9057998c37b1975e393ca2586a1d79417dd9d7d6f3d69ec7d22abb191b41"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.25.3/discipline-x86_64-apple-darwin.tar.gz"
      sha256 "c87b857782c5021ad2f84b5e6845e344f14e33686270ca0d6f11208ab92f6261"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.25.3/discipline-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5039e6af20d52b4af8eea7a1ae59142310aca9a4b7aa238e490b4054d3234c7e"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.25.3/discipline-x86_64-unknown-linux-musl.tar.gz"
      sha256 "88842763ea0cfe0c2905f130542cb26b51bab80b3591e9771be0eba84a9403c2"
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
