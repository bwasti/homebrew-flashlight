class Flashlight < Formula
  desc "Standalone C++ library for machine learning"
  homepage "https://fl.readthedocs.io/en/latest"
  url "https://github.com/flashlight/flashlight/archive/de7a65b.tar.gz"
  version "0.3.2"
  sha256 "3c6fa27c1be2ad622e79530633fec20ac88dd1fee55a3a5c1bbe88fcf06811f9"
  license "MIT"

  depends_on "arrayfire" => :build
  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", "-DFL_ARRAYFIRE_USE_CPU=ON", \
           "-DFL_BUILD_DISTRIBUTED=OFF", "-DFL_USE_ONEDNN=OFF", "-DFL_BUILD_TESTS=OFF", \
           "-DFL_BUILD_EXAMPLES=OFF", "-DFL_BUILD_SCRIPTS=OFF", *std_cmake_args
    system "make", "-C", "build", "install"
  end

  test do
    system "false"
  end
end
