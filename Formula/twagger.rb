class Twagger < Formula
  desc "TUI Swagger/OpenAPI Documentation Viewer"
  homepage "https://github.com/valVK/twagger"
  url "https://github.com/valVK/twagger/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "294932e0eb16f2a21daba7e2ee3565afb16e1d07a1ebae0af8292642ed6f847e"
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
