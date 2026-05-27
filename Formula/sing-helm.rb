class SingHelm < Formula
  desc "Lightweight sing-box configuration manager and proxy client"
  homepage "https://github.com/kyson-dev/sing-helm"
  version "0.2.3"
  
  if Hardware::CPU.arm?
    url "https://github.com/kyson-dev/sing-helm/releases/download/v0.2.3/sing-helm-darwin-arm64"
    sha256 "3083b90419bdb7cb33dcd8f78fb2cdae89fbecd02439c1d69b40866e5de50aed"
  else
    url "https://github.com/kyson-dev/sing-helm/releases/download/v0.2.3/sing-helm-darwin-amd64"
    sha256 "06c72f0f9b4e436a887345c3a289740d19ffb3180adf8c2200e34dd01456873d"
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
