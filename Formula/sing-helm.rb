class SingHelm < Formula
  desc "Lightweight sing-box configuration manager and proxy client"
  homepage "https://github.com/kyson-dev/sing-helm"
  version "0.2.8"
  
  if Hardware::CPU.arm?
    url "https://github.com/kyson-dev/sing-helm/releases/download/v0.2.8/sing-helm-darwin-arm64"
    sha256 "fb8a304faa0dccec2705a918219898f48b294c3d2ff0f1dd2d5e9decb228510f"
  else
    url "https://github.com/kyson-dev/sing-helm/releases/download/v0.2.8/sing-helm-darwin-amd64"
    sha256 "75e1964cb187e2acf4a4fb82d2e546fe0b0ffc09880d8da2164e9c9131a4f010"
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
