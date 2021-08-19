# Adapted from ryanjoneil/homebrew  
class Scip7 < Formula
  desc "SCIP Optimization Suite"
  homepage "https://www.scipopt.org/"
  url "https://www.scipopt.org/download/release/scipoptsuite-7.0.3.tgz"
  sha256 "5af5185a6e60cc62d1a89e3ac4fe22d32351a5158c2c04a95e180e76eb98cc07"
  version "7.0.3"

  depends_on "bison"
  depends_on "flex"
  depends_on "gmp"
  depends_on "ipopt"
  depends_on "pkg-config"
  depends_on "readline"
  depends_on "tbb@2020"
  depends_on "zlib"

  def install
    mkdir "build" do
      system "/usr/local/bin/cmake", "..", "-DCMAKE_INSTALL_PREFIX=#{prefix}", "-DIPOPT=on", "-DIPOPT_DIR=/usr/local/opt/ipopt", "-DTBB_DIR=/usr/local/opt/tbb@2020"
      system "make"
      system "make", "install"

      bin.install
      lib.install
      include.install
    end
  end
end
