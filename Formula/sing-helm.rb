class SingHelm < Formula
  desc "Lightweight sing-box configuration manager and proxy client"
  homepage "https://github.com/kyson-dev/sing-helm"
  version "0.2.1"
  
  if Hardware::CPU.arm?
    url "https://github.com/kyson-dev/sing-helm/releases/download/v0.2.1/sing-helm-darwin-arm64"
    sha256 "0cfe999a914040d3981148acc2ab905968909a7372d7b1fae817c901f1f9e20a"
  else
    url "https://github.com/kyson-dev/sing-helm/releases/download/v0.2.1/sing-helm-darwin-amd64"
    sha256 "afcf4a1a5084007047b59c30bcf626faa4934971b4993fafe5d9432f1ac0a0cf"
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
