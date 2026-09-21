# typed: false
# frozen_string_literal: true

class Discipline < Formula
  desc "Universal CI/CD gatekeeper and AI coding agent diff sentinel"
  homepage "https://github.com/orieg/discipline"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.7.2/discipline-aarch64-apple-darwin.tar.gz"
      sha256 "f645eea15a96491894c09edec6c2ddf5668bc1e29e41f5a136cf5d2891f1e85f"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.7.2/discipline-x86_64-apple-darwin.tar.gz"
      sha256 "839a801d85cc75b0daeea4cbacb11d6bfca4039e5e810ac324b3ccebe68498d8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.7.2/discipline-aarch64-unknown-linux-musl.tar.gz"
      sha256 "97c21e4f117aae69a0dde178ded3bd14b8d0a8844019b3c00b9b4bf050e812b2"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.7.2/discipline-x86_64-unknown-linux-musl.tar.gz"
      sha256 "80e2695bd72ce30390ef926d2bae4f8c347aef2103063bfcc97a6c52c21effb1"
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
