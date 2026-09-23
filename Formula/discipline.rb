# typed: false
# frozen_string_literal: true

class Discipline < Formula
  desc "Universal CI/CD gatekeeper and AI coding agent diff sentinel"
  homepage "https://github.com/orieg/discipline"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.11.0/discipline-aarch64-apple-darwin.tar.gz"
      sha256 "d7bf9627087e25023274eadbb963f7b58594666c9fc416b459946a1b24d989e0"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.11.0/discipline-x86_64-apple-darwin.tar.gz"
      sha256 "41fef2951956ff60cbb2d6b232fcebaccddda05ef6035754e31c320c5b919535"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.11.0/discipline-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f219821f8f9ca3f9a2ee3ef2405c04fa7b64dbf3a07f909766b32cf4176458c6"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.11.0/discipline-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3e47b367a9088d627fb5d924cea1f35515226b8f08d6322626c3b38785da26af"
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
