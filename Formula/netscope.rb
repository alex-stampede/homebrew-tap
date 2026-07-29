class Netscope < Formula
  desc "Live macOS network diagnostics for cloud gaming and microstuttering"
  homepage "https://github.com/alex-stampede/netscope"
  url "https://github.com/alex-stampede/netscope/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "3d51ed207934986a9e298bf054a1a80e21857bb2904f87177c5297d0cc1e6750"
  license "MIT"

  depends_on "go" => :build
  depends_on :macos

  def install
    ldflags = "-s -w -X github.com/alex-stampede/netscope/cmd.version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "."
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/netscope --version")
    assert_match "Diagnóstico TUI", shell_output("#{bin}/netscope --help")
  end
end
