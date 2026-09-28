# typed: false
# frozen_string_literal: true

class Discipline < Formula
  desc "Universal CI/CD gatekeeper and AI coding agent diff sentinel"
  homepage "https://github.com/orieg/discipline"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.14.4/discipline-aarch64-apple-darwin.tar.gz"
      sha256 "39e1e2fd0c0c31eb103b6222c754f5b46a46790092572e7a72e29afb1c18cfe8"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.14.4/discipline-x86_64-apple-darwin.tar.gz"
      sha256 "b5843af7408d6a292c041de98e6852e237ea39c084853c230f31bd460049f902"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.14.4/discipline-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5a76026598e7ddcb9787ae42b0deb1649df1a9e1c9d141935f71258428398fec"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.14.4/discipline-x86_64-unknown-linux-musl.tar.gz"
      sha256 "264c3fe46f508ec28ea422a7357ab1cd585a5ff2bfbc35d4484a39c314dd5bf8"
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
