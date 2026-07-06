class SingHelm < Formula
  desc "Lightweight sing-box configuration manager and proxy client"
  homepage "https://github.com/kyson-dev/sing-helm"
  version "0.2.7"
  
  if Hardware::CPU.arm?
    url "https://github.com/kyson-dev/sing-helm/releases/download/v0.2.7/sing-helm-darwin-arm64"
    sha256 "ce91daca20621a7308ae8a8041a81f522b4c1366a4cc5556e2564ab77777269c"
  else
    url "https://github.com/kyson-dev/sing-helm/releases/download/v0.2.7/sing-helm-darwin-amd64"
    sha256 "b16164ee895d2a1df5cc48e5ec05c1d13ce884c1ecaf3b9dd0b34f4a89f2a304"
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
