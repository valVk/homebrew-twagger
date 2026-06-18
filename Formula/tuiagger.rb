class Tuiagger < Formula
  desc "TUI Swagger/OpenAPI Documentation Viewer"
  homepage "https://github.com/valVK/twagger"
  url "https://github.com/valVK/tuiagger/archive/refs/tags/v1.0.6.tar.gz"
  sha256 "302429e3f2a5787d32cdbcb48e098cec283c7ce8d092fc82a5f7ca2e100d22bc"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", "--no-audit", "--no-fund"
    system "npm", "run", "build"
    system "npm", "prune", "--omit=dev"
    libexec.install Dir["*"]
    chmod 0755, libexec/"dist/index.js"
    bin.install_symlink libexec/"dist/index.js" => "tuiagger"
  end

  test do
    assert_match "TUI Swagger", shell_output("#{bin}/tuiagger --help 2>&1")
  end
end
