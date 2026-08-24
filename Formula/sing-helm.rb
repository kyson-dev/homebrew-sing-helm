class SingHelm < Formula
  desc "Lightweight sing-box configuration manager and proxy client"
  homepage "https://github.com/kyson-dev/sing-helm"
  version "0.2.12"
  
  if Hardware::CPU.arm?
    url "https://github.com/kyson-dev/sing-helm/releases/download/v0.2.12/sing-helm-darwin-arm64"
    sha256 "559b83334a8a97e6c26209b30249248d930d971b0476829b68d8275f783990e1"
  else
    url "https://github.com/kyson-dev/sing-helm/releases/download/v0.2.12/sing-helm-darwin-amd64"
    sha256 "3da28dd1b7f9f0ef0d4292de0002208d037af4d021dc758b66003eac8ef98996"
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
