# typed: false
# frozen_string_literal: true

class Discipline < Formula
  desc "Universal CI/CD gatekeeper and AI coding agent diff sentinel"
  homepage "https://github.com/orieg/discipline"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.10.2/discipline-aarch64-apple-darwin.tar.gz"
      sha256 "a8a7d8bb67a0dae1c4dd2a25b4d655880910059211945e3c3b334e6dce502396"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.10.2/discipline-x86_64-apple-darwin.tar.gz"
      sha256 "23045f46c523dfbb0e2288e15f9b2ba1663572c47936f279d5af3851f4009a50"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.10.2/discipline-aarch64-unknown-linux-musl.tar.gz"
      sha256 "2014b9cabd9a7d41810d41cd47bde470e86e339f947f60da67a818948e1c9417"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.10.2/discipline-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a529725e93a739db2f1896daf281738da3453cbc4bb938f25317c9e555a479b2"
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
