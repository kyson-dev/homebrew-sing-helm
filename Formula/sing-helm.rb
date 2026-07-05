class SingHelm < Formula
  desc "Lightweight sing-box configuration manager and proxy client"
  homepage "https://github.com/kyson-dev/sing-helm"
  version "0.2.6"
  
  if Hardware::CPU.arm?
    url "https://github.com/kyson-dev/sing-helm/releases/download/v0.2.6/sing-helm-darwin-arm64"
    sha256 "82f746b238bf69c94b7c7fa0905bc64aa08c005faa3efe9cce26f0cd9054d8cb"
  else
    url "https://github.com/kyson-dev/sing-helm/releases/download/v0.2.6/sing-helm-darwin-amd64"
    sha256 "f3085f6f059425ebdd11394e13fb95b486c93bc5e37de08e138543841e3a5ce2"
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
