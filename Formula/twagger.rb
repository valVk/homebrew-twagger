class Twagger < Formula
  desc "TUI Swagger/OpenAPI Documentation Viewer"
  homepage "https://github.com/valVK/twagger"
  url "https://github.com/valVK/twagger/archive/refs/tags/v1.0.4.tar.gz"
  sha256 "f42045f50a0125c30ed2fd35470b9afe09d2ed7071f538c5c254c1b401434d08"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", "--no-audit", "--no-fund"
    system "npm", "run", "build"
    system "npm", "prune", "--omit=dev"
    libexec.install Dir["*"]
    chmod 0755, libexec/"dist/index.js"
    bin.install_symlink libexec/"dist/index.js" => "twagger"
  end

  test do
    assert_match "TUI Swagger", shell_output("#{bin}/twagger --help 2>&1")
  end
end
