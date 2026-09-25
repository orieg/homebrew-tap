# typed: false
# frozen_string_literal: true

class Discipline < Formula
  desc "Universal CI/CD gatekeeper and AI coding agent diff sentinel"
  homepage "https://github.com/orieg/discipline"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.12.3/discipline-aarch64-apple-darwin.tar.gz"
      sha256 "c802770a4af25b866636fa32d5e106336655229fdcbf72d00e04cd2d7e413dbb"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.12.3/discipline-x86_64-apple-darwin.tar.gz"
      sha256 "bdbe15ef0410b1be49af2d5070e80ed5aa13c555a7cb7b944329fab842319659"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.12.3/discipline-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ab7b13b44440b397a855ed5b4ce69d4cf96a9ce07d4fd49da98010dce990d00d"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.12.3/discipline-x86_64-unknown-linux-musl.tar.gz"
      sha256 "05a0ba9cfad3533b12281368b14ad46c8a4b3c6a7088c51d3ab27ccace602758"
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
