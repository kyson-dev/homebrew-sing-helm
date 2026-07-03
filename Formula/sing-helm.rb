class SingHelm < Formula
  desc "Lightweight sing-box configuration manager and proxy client"
  homepage "https://github.com/kyson-dev/sing-helm"
  version "0.2.4"
  
  if Hardware::CPU.arm?
    url "https://github.com/kyson-dev/sing-helm/releases/download/v0.2.4/sing-helm-darwin-arm64"
    sha256 "6987a1a9e6bd19c50d62038c230164054b7f92f8eef3e8260651e4f182634673"
  else
    url "https://github.com/kyson-dev/sing-helm/releases/download/v0.2.4/sing-helm-darwin-amd64"
    sha256 "525abe3d57fa448a7a3a8918238e39e11bf29e47c58ab76ae7cadd7676eedb6e"
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
