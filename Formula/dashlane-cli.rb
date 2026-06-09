class DashlaneCli < Formula
  desc "Command-line interface for Dashlane"
  homepage "https://dashlane.com"
  url "https://github.com/Dashlane/dashlane-cli/archive/refs/tags/v6.2614.0.tar.gz"
  sha256 "943ba342fe2da6ce62fc977d4e83622d0259911d43ec679c62f91c8b7e5a9941"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    # macos 12+ only
    depends_on macos: :monterey
  end

  def install
    system "wget", "https://github.com/Dashlane/dashlane-cli/releases/download/v6.2614.0/dcli-macos-arm64", "dcli"
    bin.install "dcli"
  end

  test do
    # Test cli version
    assert_equal version.to_s, shell_output("#{bin}/dcli --version").chomp
  end
end
