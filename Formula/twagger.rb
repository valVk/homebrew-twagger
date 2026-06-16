class Twagger < Formula
  desc "TUI Swagger/OpenAPI Documentation Viewer"
  homepage "https://github.com/valVK/twagger"
  url "https://github.com/valVK/twagger/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "REPLACE_WITH_SHA256"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", "--no-audit", "--no-fund"
    system "npm", "run", "build"
    system "npm", "prune", "--omit=dev"
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"dist/index.js"
  end

  test do
    assert_match "TUI Swagger", shell_output("#{bin}/twagger --help 2>&1")
  end
end
