# typed: false
# frozen_string_literal: true

class Discipline < Formula
  desc "Universal CI/CD gatekeeper and AI coding agent diff sentinel"
  homepage "https://github.com/orieg/discipline"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.28.1/discipline-aarch64-apple-darwin.tar.gz"
      sha256 "0e4e1dfd046ee429a7c6290346b77b68f8f5b7144bdf492a06fada0cc25485d4"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.28.1/discipline-x86_64-apple-darwin.tar.gz"
      sha256 "ab28487ff706ec25d9e9d3c6a6c1cb6380686284e0e8e49c960566dcc9c8c4dc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.28.1/discipline-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c53f347709b1be143e5fbf89f48cb7ab5abc01d9282b128eaed37cb73eea96bd"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.28.1/discipline-x86_64-unknown-linux-musl.tar.gz"
      sha256 "854ef439eece288917a9d23d4cf9e6a0ca1d0d0b2818da81f10168d5fc27c6eb"
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
