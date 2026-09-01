class SingHelm < Formula
  desc "Lightweight sing-box configuration manager and proxy client"
  homepage "https://github.com/kyson-dev/sing-helm"
  version "0.2.17"
  
  if Hardware::CPU.arm?
    url "https://github.com/kyson-dev/sing-helm/releases/download/v0.2.17/sing-helm-darwin-arm64"
    sha256 "3e7e45e8cdf80badb056e92589e1ba431a8a38bf17fe88a28365ac3962230c8f"
  else
    url "https://github.com/kyson-dev/sing-helm/releases/download/v0.2.17/sing-helm-darwin-amd64"
    sha256 "c08247ed717f6f685ebcd13da767c43cb231fe3e00e94f729317fb1aa14b55e1"
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
