class SingHelm < Formula
  desc "Lightweight sing-box configuration manager and proxy client"
  homepage "https://github.com/kyson-dev/sing-helm"
  version "0.2.15"
  
  if Hardware::CPU.arm?
    url "https://github.com/kyson-dev/sing-helm/releases/download/v0.2.15/sing-helm-darwin-arm64"
    sha256 "fec90c09e1b5e213b17c462b3b418fbf073815e9aea8ac543cb2b16e11f58563"
  else
    url "https://github.com/kyson-dev/sing-helm/releases/download/v0.2.15/sing-helm-darwin-amd64"
    sha256 "748f80cc93093890d74b549e31afa05f52c0dc1363d1842b904fb7b920e65940"
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
