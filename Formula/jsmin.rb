class Jsmin < Formula
  desc "Minify JavaScript code"
  homepage "https://www.crockford.com/javascript/jsmin.html"
  url "https://github.com/douglascrockford/JSMin/archive/e877e1e352c350bc9da5bac98c88442ea4b9399c.tar.gz"
  version "2026-02-25"
  sha256 "8b7b13526ee015c1933c89165bfd044156cad867487e1cd0cbe141cabcee8657"
  license "JSON"

  # Upstream has no tags/releases and this formula uses a commit tarball URL,
  # so automatic livecheck bumps can't update the URL reliably.
  livecheck do
    skip "Manual updates only: version/date bumps require updating the commit-based URL and checksum."
  end

  def install
    system ENV.cc, "jsmin.c", "-o", "jsmin"
    bin.install "jsmin"
  end

  test do
    assert_equal "\nvar i=0;", pipe_output(bin/"jsmin", "var i = 0; // comment")
  end
end
