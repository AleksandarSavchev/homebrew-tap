# typed: true
# frozen_string_literal: true

# Diki is a formula for installing Diki
class Diki < Formula
  desc "Command-line tool for compliance checks"
  homepage "https://gardener.cloud"
  version "1.5.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/AleksandarSavchev/diki/releases/download/v1.5.0/diki-darwin-arm64"
      sha256 "a98e60fb3ee26db9e8f6b25661b767334aecc92018fd18d72ca539cb8af022a9"
    else
      url "https://github.com/AleksandarSavchev/diki/releases/download/v1.5.0/diki-darwin-amd64"
      sha256 "cc07ccaa42f45701c4a6f508df0c14e57115803c8cbff75c1d83c7c1e4da7a20"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/AleksandarSavchev/diki/releases/download/v1.5.0/diki-linux-arm64"
      sha256 "78cffd46856fdffb8ea40afab7ce8ad5d9dbca0a0dabda1504363d952142e74b"
    else
      url "https://github.com/AleksandarSavchev/diki/releases/download/v1.5.0/diki-linux-amd64"
      sha256 "d43f86e16a7002417b0b15b5b8938932e66ee5b8e589dc1f30d710d4528f0456"
      depends_on arch: :x86_64
    end
  end

  def install
    bin.install stable.url.split("/")[-1] => "diki"
  end

  def caveats
    <<~EOS
      [HINT]
      Run `diki view provider` to view supported providers and rulesets.
      Run `diki --help` for more information.
    EOS
  end

  test do
    system "#{bin}/diki", "version"
  end
end
