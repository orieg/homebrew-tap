# typed: false
# frozen_string_literal: true

class Discipline < Formula
  desc "Universal CI/CD gatekeeper and AI coding agent diff sentinel"
  homepage "https://github.com/orieg/discipline"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.17.2/discipline-aarch64-apple-darwin.tar.gz"
      sha256 "d0938ec94222e639d59706e09ae8a5387931766cb319add72f50fdda9495fe89"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.17.2/discipline-x86_64-apple-darwin.tar.gz"
      sha256 "a819ad90d108b6e46089c459baec43f8a680fc3f9fe287b49c7e3c518b50e255"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.17.2/discipline-aarch64-unknown-linux-musl.tar.gz"
      sha256 "956d2a148829d6e352fb763af0f323f605a96e5a2f64a130ffe04c639b0e9d35"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.17.2/discipline-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2060871bbdfcc03ba8f6b59e4358bd3c9ffadf099b8a190944e81bda7bd2ce1a"
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
