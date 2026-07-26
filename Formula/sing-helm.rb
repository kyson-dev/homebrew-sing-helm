class SingHelm < Formula
  desc "Lightweight sing-box configuration manager and proxy client"
  homepage "https://github.com/kyson-dev/sing-helm"
  version "0.2.11"
  
  if Hardware::CPU.arm?
    url "https://github.com/kyson-dev/sing-helm/releases/download/v0.2.11/sing-helm-darwin-arm64"
    sha256 "963d99eae82f69134e065e3350b7f98ac522f964de625f52ef951530f184ed6e"
  else
    url "https://github.com/kyson-dev/sing-helm/releases/download/v0.2.11/sing-helm-darwin-amd64"
    sha256 "b4f098b41ff2d2ee7eaf2a362b6960abf9e6003ece16b12f0ccb858ec273d6d0"
  end

  def install
    bin.install "sing-helm-darwin-arm64" => "sing-helm" if Hardware::CPU.arm?
    bin.install "sing-helm-darwin-amd64" => "sing-helm" if Hardware::CPU.intel?
  end

  def caveats
    <<~EOS
      To start sing-helm as a system service:
        sudo sing-helm autostart on
      
      To run sing-helm manually:
        sudo sing-helm run
    EOS
  end

  test do
    system "#{bin}/sing-helm", "version"
  end
end
