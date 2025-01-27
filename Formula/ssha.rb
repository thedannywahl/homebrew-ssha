class Ssha < Formula
  desc "Generate RFC 2307 SSHA password hashes."
  homepage "https://github.com/thedannywahl/ssha"
  url "https://github.com/thedannywahl/ssha/archive/refs/tags/1.1.0.zip"
  sha256 "2a712e19e50a2429f5a83764ed91e05ec6a92827d0a4bc972a77d37fb7f4a288"
  license "Apache-2.0"

  def install
    bin.install "ssha"
  end

  test do

    # Tests use the password "password" and salt "salt"

    # Ensure the binary outputs the expected hash
    assert_equal "{SSHA}Yzg4ZTljNjcwNDFhNzRlMDM1N2JlZmRmZjkzZjg3ZGRlMDkwNDIxNHNhbHQ=", shell_output("#{bin}/ssha password salt").strip

    # Ensure the base64 encoded string is correct
    asset_equal"Yzg4ZTljNjcwNDFhNzRlMDM1N2JlZmRmZjkzZjg3ZGRlMDkwNDIxNHNhbHQ=", shell_output("#{bin}/ssha password salt | sed 's/{SSHA}//g'").strip

    # Ensure the hash can be base64 decoded
    assert_equal "c88e9c67041a74e0357befdff93f87dde0904214salt", shell_output("#{bin}/ssha password salt | sed 's/{SSHA}//g' | base64 -d").strip

    # Ensure the sha1sum matches the expected hash
    assert_equal "c88e9c67041a74e0357befdff93f87dde0904214", shell_output("#{bin}/ssha password salt | sed 's/{SSHA}//g' | base64 -d | sed 's/salt//g'").strip
  end
end
