class SingHelm < Formula
  desc "Lightweight sing-box configuration manager and proxy client"
  homepage "https://github.com/kyson-dev/sing-helm"
  version "0.2.10"
  
  if Hardware::CPU.arm?
    url "https://github.com/kyson-dev/sing-helm/releases/download/v0.2.10/sing-helm-darwin-arm64"
    sha256 "beba3a49558e33ba5238805c4bcfe78a0be4539acf03eefb6984cb8e2d5b3a62"
  else
    url "https://github.com/kyson-dev/sing-helm/releases/download/v0.2.10/sing-helm-darwin-amd64"
    sha256 "55b64153abca9c072baa9ebb69475886794ece9ee51c6e58e6b66579ae5de917"
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
