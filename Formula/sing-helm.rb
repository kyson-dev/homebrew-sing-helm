class SingHelm < Formula
  desc "Lightweight sing-box configuration manager and proxy client"
  homepage "https://github.com/kyson-dev/sing-helm"
  version "0.2.18"
  
  if Hardware::CPU.arm?
    url "https://github.com/kyson-dev/sing-helm/releases/download/v0.2.18/sing-helm-darwin-arm64"
    sha256 "c8c0fb2fa2203284aaa8e294fc52a8a0fbf551c94b2d7010c41f9fbfb57a4948"
  else
    url "https://github.com/kyson-dev/sing-helm/releases/download/v0.2.18/sing-helm-darwin-amd64"
    sha256 "8686de6b0027b09e5d1e3df327a07fc0208f41c564e2eb5c5f54783b0d66fcb1"
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
