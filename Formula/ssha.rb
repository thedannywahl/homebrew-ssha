class Ssha < Formula
  desc "Generate RFC 2307 SSHA password hashes."
  homepage "https://github.com/thedannywahl/ssha"
  url "https://github.com/thedannywahl/ssha/archive/refs/tags/1.0.1.zip"
  sha256 "fc5b1a854f42f6c4189aa9b3e4b477fee34b7c78bcf6672fd61ec39d57cd3409"
  license "Apache-2.0"

  def install
    bin.install "ssha"
  end

  test do

    # Tests use the password "password" and salt "salt"

    # Ensure the binary outputs the expected hash
    assert_equal "e1NTSEF9Yzg4ZTljNjcwNDFhNzRlMDM1N2JlZmRmZjkzZjg3ZGRlMDkwNDIxNHNhbHQ=", shell_output("#{bin}/ssha password salt").strip

    # Ensure the hash can be base64 decoded
    assert_equal "{SSHA}c88e9c67041a74e0357befdff93f87dde0904214salt", shell_output("#{bin}/ssha password salt | base64 -d").strip

    # Ensure the sha1sum matches the expected hash
    assert_equal "c88e9c67041a74e0357befdff93f87dde0904214", shell_output("#{bin}/ssha password salt | base64 -d | sed 's/{SSHA}//g; s/salt//g").strip
  end
end
