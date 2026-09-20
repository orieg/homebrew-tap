# typed: false
# frozen_string_literal: true

class Discipline < Formula
  desc "Universal CI/CD gatekeeper and AI coding agent diff sentinel"
  homepage "https://github.com/orieg/discipline"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.4.0/discipline-aarch64-apple-darwin.tar.gz"
      sha256 "c4c446b08bb84881eb0dbd3618ef1903b9e090ac848ef651e0313c607a8ba70b"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.4.0/discipline-x86_64-apple-darwin.tar.gz"
      sha256 "2fcf1c70724ea583ab5e9087ecc6f615d9202516c0677ecf786cd700cfe81e04"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/orieg/discipline/releases/download/v0.4.0/discipline-aarch64-unknown-linux-musl.tar.gz"
      sha256 "355a97357072848937a33c0576dab1e9842961fa49f347ead2769ddf38e1988a"
    else
      url "https://github.com/orieg/discipline/releases/download/v0.4.0/discipline-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1ad58e075b1268674a49b06b69b63b9525a2e391ecc9888588d7c6c8e95a5db2"
    end
  end

  def install
    bin.install "discipline"
  end

  test do
    assert_match "discipline #{version}", shell_output("#{bin}/discipline --version")
  end
end
