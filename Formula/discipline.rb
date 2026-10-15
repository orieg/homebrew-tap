# typed: false
# frozen_string_literal: true

class Discipline < Formula
  desc "Universal CI/CD gatekeeper and AI coding agent diff sentinel"
  homepage "https://github.com/orieg/discipline"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.21.1/discipline-aarch64-apple-darwin.tar.gz"
      sha256 "e3ef44996e7c895bc0b05633dc9312c27c39a20dd09822d820f33a97153dbe65"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.21.1/discipline-x86_64-apple-darwin.tar.gz"
      sha256 "43f6eec9a23544ed4b1674f6d4745a6b7f09c5430d5dee4e833399efec2056f3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.21.1/discipline-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d33298ede4c06451847f1a44079dd693c4ccf4537beff7af899ad04f1a7a09ba"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.21.1/discipline-x86_64-unknown-linux-musl.tar.gz"
      sha256 "169df21b9bc38d7b029bfd418e4fc40ba6844262047a5a8ad3bbe6258b664eb0"
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
