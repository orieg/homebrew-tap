# typed: false
# frozen_string_literal: true

class Discipline < Formula
  desc "Universal CI/CD gatekeeper and AI coding agent diff sentinel"
  homepage "https://github.com/orieg/discipline"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.10.1/discipline-aarch64-apple-darwin.tar.gz"
      sha256 "3851c3be57d894eae5f3e12a4ddc54f8eafe441366a2a756b20bfb9934de934b"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.10.1/discipline-x86_64-apple-darwin.tar.gz"
      sha256 "61496a48ea41b1077ac69f9d4324180f9299f5b9fc0f5971cfbb2172b76213a3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.10.1/discipline-aarch64-unknown-linux-musl.tar.gz"
      sha256 "58b390c01aca5b829b03c4587018d0d98550c2d1ff67b30d4c6db5238677748c"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.10.1/discipline-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8217ac8299faeba37379527fbdc28096e3dfa25c0aa29b914430009aa771c2f0"
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
