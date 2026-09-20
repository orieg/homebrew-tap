# typed: false
# frozen_string_literal: true

class Discipline < Formula
  desc "Universal CI/CD gatekeeper and AI coding agent diff sentinel"
  homepage "https://github.com/orieg/discipline"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.5.0/discipline-aarch64-apple-darwin.tar.gz"
      sha256 "781beb649d8415abf6e0c21c4a62e406cedd7286a18b9be6b0cd1c9b1bc69a59"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.5.0/discipline-x86_64-apple-darwin.tar.gz"
      sha256 "0614871129a2e3bbc754f4770fbf513bcfd0c0170ca83b5d05242ff134fc3518"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.5.0/discipline-aarch64-unknown-linux-musl.tar.gz"
      sha256 "dc0877214eed3364e2945b0ee08693fa0eb88703c035c449c8c8cdf33474629f"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.5.0/discipline-x86_64-unknown-linux-musl.tar.gz"
      sha256 "17466dc0eff0ff895fc69d811f656f492a2fbef2e0a22b5c30da0569d3ca533e"
    end
  end

  def install
    bin.install "discipline"
  end

  test do
    assert_match "discipline #{version}", shell_output("#{bin}/discipline --version")
  end
end
