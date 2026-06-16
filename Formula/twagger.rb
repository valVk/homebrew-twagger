class Twagger < Formula
  desc "TUI Swagger/OpenAPI Documentation Viewer"
  homepage "https://github.com/valVK/twagger"
  url "https://github.com/valVK/twagger/archive/refs/tags/v1.0.3.tar.gz"
  sha256 "1b85dd50b56d4528aecd11f8d67d2a4102bb009a6f6ebbd4b0afdcda59c75bf5"
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
