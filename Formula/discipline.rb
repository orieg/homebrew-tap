# typed: false
# frozen_string_literal: true

class Discipline < Formula
  desc "Universal CI/CD gatekeeper and AI coding agent diff sentinel"
  homepage "https://github.com/orieg/discipline"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.4.1/discipline-aarch64-apple-darwin.tar.gz"
      sha256 "b2346046002333743a80eb115edca0e8b34b5992287400a0f642c663c2fcf39b"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.4.1/discipline-x86_64-apple-darwin.tar.gz"
      sha256 "545d23fb99a524c57703bc5ecc100fea02db094ad1776c2593d6ccae961bdf95"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.4.1/discipline-aarch64-unknown-linux-musl.tar.gz"
      sha256 "931c6c03af20498444bf918fe48351653f72ba32f64fa4f144fc9ae77a754ee5"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.4.1/discipline-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3b13afefceb8a451c475b5d53f5ad7dbc0a0421e54e212a60f9eb1157f9ea310"
    end
  end

  def install
    bin.install "discipline"
  end

  test do
    assert_match "discipline #{version}", shell_output("#{bin}/discipline --version")
  end
end
