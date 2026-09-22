# typed: false
# frozen_string_literal: true

class Discipline < Formula
  desc "Universal CI/CD gatekeeper and AI coding agent diff sentinel"
  homepage "https://github.com/orieg/discipline"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.9.0/discipline-aarch64-apple-darwin.tar.gz"
      sha256 "d5821d0679ad300dcfba3514a8a19dde2165ea5e72eaa60311d639857430beb1"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.9.0/discipline-x86_64-apple-darwin.tar.gz"
      sha256 "2f9dbf19bdd4b94873b52eb98c3c46a7fcada1bdd6d3c349e225fd107a2ccf99"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.9.0/discipline-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7cd1d52aabf8728e2207e385fcea69b73deb35aee86896d06e40e56a98f9a20d"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.9.0/discipline-x86_64-unknown-linux-musl.tar.gz"
      sha256 "21996c5c2f69fe22c6763e5c1bef675584081567bbe5ac62c23c7c0e669e6c73"
    end
  end

  def install
    bin.install "discipline"
    man1.install "man/man1/discipline.1" if File.exist?("man/man1/discipline.1")
    man5.install "man/man5/discipline.toml.5" if File.exist?("man/man5/discipline.toml.5")
  end

  test do
    assert_match "discipline #{version}", shell_output("#{bin}/discipline --version")
  end
end
