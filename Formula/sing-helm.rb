class SingHelm < Formula
  desc "Lightweight sing-box configuration manager and proxy client"
  homepage "https://github.com/kyson-dev/sing-helm"
  version "0.2.16"
  
  if Hardware::CPU.arm?
    url "https://github.com/kyson-dev/sing-helm/releases/download/v0.2.16/sing-helm-darwin-arm64"
    sha256 "c4c1a33164ddf1083ade86f27584280eeb83ec376975e59787e27bf90844e812"
  else
    url "https://github.com/kyson-dev/sing-helm/releases/download/v0.2.16/sing-helm-darwin-amd64"
    sha256 "f84e9b5e9457ee8029a1ac25156c55667ab1972c00745e12a0e00273f56bb244"
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
