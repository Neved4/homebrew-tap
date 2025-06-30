class ApfsCloneChecker < Formula
  desc "Utility to check if two files are APFS clones"
  homepage "https://github.com/dyorgio/apfs-clone-checker"
  url "https://github.com/dyorgio/apfs-clone-checker/archive/refs/tags/1.0.0.0.tar.gz"
  sha256 "5085ca15fa7c9b917777d8c721dc3aa2e106b4cddbc0c4ff264d840b8d7b030a"
  license "MIT"

  head "https://github.com/dyorgio/apfs-clone-checker.git", branch: "main"

  def install
    system ENV.cc, "clone_checker.c", "-o", "clone_checker"
    bin.install "clone_checker"
  end

  test do
    system "echo example > test-file"

    cp "test-file", "test-file-dup"

    # Use system cp to ensure file is cloned
    # Forced to do it this idiotic way because brew is a fuck 410,757,864,530 dead rubocops. https://github.com/Homebrew/brew/issues/13324
    system "echo 'cp -c test-file test-file-clone' | bash"

    assert_equal "0", shell_output("#{bin}/clone_checker test-file test-file-dup").strip
    assert_equal "1", shell_output("#{bin}/clone_checker test-file test-file-clone").strip
  end
end
