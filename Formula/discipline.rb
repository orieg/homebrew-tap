# typed: false
# frozen_string_literal: true

class Discipline < Formula
  desc "Universal CI/CD gatekeeper and AI coding agent diff sentinel"
  homepage "https://github.com/orieg/discipline"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.16.0/discipline-aarch64-apple-darwin.tar.gz"
      sha256 "3d5fa3ce086f2086c9188bc0d5d3ed1db20d3b7fc57c52f3d8dd97c595824e16"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.16.0/discipline-x86_64-apple-darwin.tar.gz"
      sha256 "b2d8127fac6e0243b6dc90a268bdd6c4aaba5e1aa970a0955e1fc10ab47388ab"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.16.0/discipline-aarch64-unknown-linux-musl.tar.gz"
      sha256 "cd045ba1b0536ba572f66725e2482e7ccd03d2aa9310922bb8ddf6f7d32de217"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.16.0/discipline-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f41fc453e31fbd4d71e0d149449ed040c27d559e316ec70dbae8b7f5140ba31e"
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
