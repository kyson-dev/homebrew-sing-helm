class SingHelm < Formula
  desc "Lightweight sing-box configuration manager and proxy client"
  homepage "https://github.com/kyson-dev/sing-helm"
  version "0.2.19"
  
  if Hardware::CPU.arm?
    url "https://github.com/kyson-dev/sing-helm/releases/download/v0.2.19/sing-helm-darwin-arm64"
    sha256 "651259f3237f9eed75e312dc44a7d70b99626b57219d0d76860538f1278ac5a6"
  else
    url "https://github.com/kyson-dev/sing-helm/releases/download/v0.2.19/sing-helm-darwin-amd64"
    sha256 "ff89e94b8bc2f4622450d6f9b96e0ea23c7d4843945fdb173755b74e41d4f24c"
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
