# typed: false
# frozen_string_literal: true

class Discipline < Formula
  desc "Universal CI/CD gatekeeper and AI coding agent diff sentinel"
  homepage "https://github.com/orieg/discipline"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.27.0/discipline-aarch64-apple-darwin.tar.gz"
      sha256 "96c6d37a6a063718924fe53ad117a986112591aaffc2a86b2b8e3f3536baa5c7"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.27.0/discipline-x86_64-apple-darwin.tar.gz"
      sha256 "046186c68e66b60d8003b592093cec12d571cc6876b497a38b14953144e268ee"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.27.0/discipline-aarch64-unknown-linux-musl.tar.gz"
      sha256 "86d4af98ef9e1691339dbf5a4e75efefdaa24f0310ab8ec6e2a002c0c77016a7"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.27.0/discipline-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0535dc61f024cf31dd6076653c5e7d3dd08f02e9b22d588e9778d32353aab8a4"
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
