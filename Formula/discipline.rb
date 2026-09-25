# typed: false
# frozen_string_literal: true

class Discipline < Formula
  desc "Universal CI/CD gatekeeper and AI coding agent diff sentinel"
  homepage "https://github.com/orieg/discipline"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.13.1/discipline-aarch64-apple-darwin.tar.gz"
      sha256 "114246489dfa464a3dfd54b3ffa2126c2177f594173f1f85a57433bb77ed34b2"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.13.1/discipline-x86_64-apple-darwin.tar.gz"
      sha256 "b120cd57df6469780beffe3959786ebf69ba131b86c846e50a43a3bebaa99110"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.13.1/discipline-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8040562dd420826768e9765c55a1254dd3b76ccfa4f8c2a3ca9ab917f255cc35"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.13.1/discipline-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0a760d0f13900c111efa78d083c7efd835938d15dddec717c0afaf9781fefe53"
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
