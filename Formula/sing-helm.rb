class SingHelm < Formula
  desc "Lightweight sing-box configuration manager and proxy client"
  homepage "https://github.com/kyson-dev/sing-helm"
  version "0.2.2"
  
  if Hardware::CPU.arm?
    url "https://github.com/kyson-dev/sing-helm/releases/download/v0.2.2/sing-helm-darwin-arm64"
    sha256 "db7831d7b31de67cf9295ac5b119b15b53e241a8ecdfea1f62610afc84402e4c"
  else
    url "https://github.com/kyson-dev/sing-helm/releases/download/v0.2.2/sing-helm-darwin-amd64"
    sha256 "dba10657cefd4b0a7ebc077cb2660ce6dc3372a3037cc2263592893de1e19cb0"
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
