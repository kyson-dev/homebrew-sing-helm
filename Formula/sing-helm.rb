class SingHelm < Formula
  desc "Lightweight sing-box configuration manager and proxy client"
  homepage "https://github.com/kyson-dev/sing-helm"
  version "0.2.5"
  
  if Hardware::CPU.arm?
    url "https://github.com/kyson-dev/sing-helm/releases/download/v0.2.5/sing-helm-darwin-arm64"
    sha256 "63512610fae4bb7032c5e679d32025584272aedefa618491fab084afd792e800"
  else
    url "https://github.com/kyson-dev/sing-helm/releases/download/v0.2.5/sing-helm-darwin-amd64"
    sha256 "452e263d1399c39e5b4fbb9b93c4879d5e43d009d5ec4d48e5e7e40922190dbd"
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
