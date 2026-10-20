class SingHelm < Formula
  desc "Lightweight sing-box configuration manager and proxy client"
  homepage "https://github.com/kyson-dev/sing-helm"
  version "0.2.20"
  
  if Hardware::CPU.arm?
    url "https://github.com/kyson-dev/sing-helm/releases/download/v0.2.20/sing-helm-darwin-arm64"
    sha256 "30a7b4602a29fbe58ebf0596e07e2d0d51bdeab2e670605e27a9493db71af4e9"
  else
    url "https://github.com/kyson-dev/sing-helm/releases/download/v0.2.20/sing-helm-darwin-amd64"
    sha256 "d42915c4a8517fb581446ddb0c82a6a089041975eb731a69cdab94e4b94f1b8b"
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
