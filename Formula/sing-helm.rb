class SingHelm < Formula
  desc "Lightweight sing-box configuration manager and proxy client"
  homepage "https://github.com/kyson-dev/sing-helm"
  version "0.2.14"
  
  if Hardware::CPU.arm?
    url "https://github.com/kyson-dev/sing-helm/releases/download/v0.2.14/sing-helm-darwin-arm64"
    sha256 "451a229f19c1949b18cb13427f15ace44d200eb379f5edbd90403cc26afd27f7"
  else
    url "https://github.com/kyson-dev/sing-helm/releases/download/v0.2.14/sing-helm-darwin-amd64"
    sha256 "1cb6cda65def1e010ba072f6ea7aef5978581df1d3af70d00f0f0356fd07c90a"
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
