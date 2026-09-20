# typed: false
# frozen_string_literal: true

class Discipline < Formula
  desc "Universal CI/CD gatekeeper and AI coding agent diff sentinel"
  homepage "https://github.com/orieg/discipline"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.4.2/discipline-aarch64-apple-darwin.tar.gz"
      sha256 "fa838f00e90fba9a67f0d550cc2bf28162a4b3eca1d763b524458711311ad315"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.4.2/discipline-x86_64-apple-darwin.tar.gz"
      sha256 "6fe5476b02d53c9f1c5befabe3427ae4e7dc89f6cb7a4f086b7be28b3bd3de21"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.4.2/discipline-aarch64-unknown-linux-musl.tar.gz"
      sha256 "01ab788232ec06df290a32aec04ab5af11623af320efef962472c504d6d5fc58"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.4.2/discipline-x86_64-unknown-linux-musl.tar.gz"
      sha256 "30aa3d042a819c99b6b075d124fdfeb2f8362a5e53e3afa9d16551c85240467a"
    end
  end

  def install
    bin.install "discipline"
  end

  test do
    assert_match "discipline #{version}", shell_output("#{bin}/discipline --version")
  end
end
