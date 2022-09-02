# Adapted from ryanjoneil/homebrew  
class Scip8 < Formula
  desc "SCIP Optimization Suite"
  homepage "https://www.scipopt.org/"
  url "https://www.scipopt.org/download/release/scipoptsuite-8.0.1.tgz"
  sha256 "c5b4cd239f3412dfedd0d9e60e61ff4fd50ac34f26381a795cab2c3eb074142a"
  version "8.0.1"

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
