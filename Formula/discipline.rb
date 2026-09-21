# typed: false
# frozen_string_literal: true

class Discipline < Formula
  desc "Universal CI/CD gatekeeper and AI coding agent diff sentinel"
  homepage "https://github.com/orieg/discipline"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.7.0/discipline-aarch64-apple-darwin.tar.gz"
      sha256 "f4ac34163811a27cd756f6d85745a7aa67b4ffc2f4acd62f96aff55a1f0fa2ca"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.7.0/discipline-x86_64-apple-darwin.tar.gz"
      sha256 "9146e3311f8d006148f93173a07e04e56aabafc34c6297936f60a966b3c9f052"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.7.0/discipline-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f4f272ebe4f1ea0310d02762aae12cdad7751a04331de82782b6fc52d3b2134f"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.7.0/discipline-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e6044e3dc3ffceab7c7fdaf87cd291c316c978b4895a8bf023967e3c50deb959"
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
