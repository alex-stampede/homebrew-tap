class Netscope < Formula
  desc "Live macOS network diagnostics for cloud gaming and microstuttering"
  homepage "https://github.com/alex-stampede/netscope"
  url "https://github.com/alex-stampede/netscope/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "452b76c34cae2a3c953e3fc861c15e64accb3bb7ee9a6645bc53307a8b3b51a1"
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
