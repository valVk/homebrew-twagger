class Twagger < Formula
  desc "TUI Swagger/OpenAPI Documentation Viewer"
  homepage "https://github.com/valVK/twagger"
  url "https://github.com/valVK/twagger/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "8ec294e955b72ac76ec346d9c41b7b3895bd3f3ced209debc742e99752bdca06"
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
