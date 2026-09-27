# typed: false
# frozen_string_literal: true

class Discipline < Formula
  desc "Universal CI/CD gatekeeper and AI coding agent diff sentinel"
  homepage "https://github.com/orieg/discipline"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.14.2/discipline-aarch64-apple-darwin.tar.gz"
      sha256 "4ebe7fa5d8a306976812247f1671de01e8de282cd391d10b394cf0115b68c10a"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.14.2/discipline-x86_64-apple-darwin.tar.gz"
      sha256 "2cca85dc8ba1095a216ed84a39a6a839a40892f7d82dacc335f719cf373d9cfc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.14.2/discipline-aarch64-unknown-linux-musl.tar.gz"
      sha256 "773cbc2541cb4487ff00282e31f656bdbaa3a73453302b09644bca0fa1719bc3"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.14.2/discipline-x86_64-unknown-linux-musl.tar.gz"
      sha256 "59b21dd0c3c8df01b66f075be69f4e07392ee0e58a587171b686d9383c478f05"
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
