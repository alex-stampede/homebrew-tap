class Netscope < Formula
  desc "Live macOS network diagnostics for cloud gaming and microstuttering"
  homepage "https://github.com/alex-stampede/netscope"
  url "https://github.com/alex-stampede/netscope/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "603f51225e517fe9c150a957fe94303991bc08b3fd46e1d19d6d159c8a46853e"
  license "MIT"

  depends_on :macos
  depends_on "go" => :build

  def install
    ldflags = "-s -w -X github.com/alex-stampede/netscope/cmd.version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "."
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/netscope --version")
    assert_match "Diagnóstico TUI", shell_output("#{bin}/netscope --help")
  end
end
