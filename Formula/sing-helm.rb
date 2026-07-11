class SingHelm < Formula
  desc "Lightweight sing-box configuration manager and proxy client"
  homepage "https://github.com/kyson-dev/sing-helm"
  version "0.2.9"
  
  if Hardware::CPU.arm?
    url "https://github.com/kyson-dev/sing-helm/releases/download/v0.2.9/sing-helm-darwin-arm64"
    sha256 "2cecce02d6b9085f2b7697f196ac1c83faf913f6be72f6d03e368bb2bb709e89"
  else
    url "https://github.com/kyson-dev/sing-helm/releases/download/v0.2.9/sing-helm-darwin-amd64"
    sha256 "e605a638db89473fa4bae37f961fc9559c3fd2edde226961a69265dcfccee53d"
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
