# typed: false
# frozen_string_literal: true

class Discipline < Formula
  desc "Universal CI/CD gatekeeper and AI coding agent diff sentinel"
  homepage "https://github.com/orieg/discipline"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.20.1/discipline-aarch64-apple-darwin.tar.gz"
      sha256 "379e3ba037d624de0eb71e2d764ad7e970543319a5af234b8d1ff83e20da2d10"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.20.1/discipline-x86_64-apple-darwin.tar.gz"
      sha256 "736ff678f5a3d5eba5720bee890aedc1359fa1fa90c951bd1ef2d20dcd1b1e06"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.20.1/discipline-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7a515b9a9f77e802072d50693911cb9e043a546ce5a2dd5e2a86bed25afff2f2"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.20.1/discipline-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a275fe9f8caa380dc7b36ba8202b55b4a2873d089382b03ee1063809e71e7438"
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
