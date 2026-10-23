# typed: false
# frozen_string_literal: true

class Discipline < Formula
  desc "Universal CI/CD gatekeeper and AI coding agent diff sentinel"
  homepage "https://github.com/orieg/discipline"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.25.0/discipline-aarch64-apple-darwin.tar.gz"
      sha256 "b671ec9985b77e444f50155f374279249a55ef9359eb5d2546a1f5b3f72edabe"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.25.0/discipline-x86_64-apple-darwin.tar.gz"
      sha256 "9a092932bd172193be0e67cc99d0bc3fbd2067e53d700370d18d7f13fbd5c78b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.25.0/discipline-aarch64-unknown-linux-musl.tar.gz"
      sha256 "76ef411ac73d6bc7ac2fc35862e4cbfe59a3380a2def38670f5cf148e9e44899"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.25.0/discipline-x86_64-unknown-linux-musl.tar.gz"
      sha256 "28d47150c9355c60fbd48f74f4290eda9ce6881027e455b801b7f66b3677476e"
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
