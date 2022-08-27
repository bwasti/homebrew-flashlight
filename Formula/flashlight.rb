class Flashlight < Formula
  desc "Standalone C++ library for machine learning"
  homepage "https://fl.readthedocs.io/en/latest"
  url "https://github.com/jacobkahn/flashlight/archive/c343e5c.tar.gz"
  version "0.3.2"
  sha256 "11f4c7dbc2013a44b073639ffab39897c34e8c76a61d459e655ea0b6ff8b6828"
  license "MIT"

  depends_on "arrayfire" => :build
  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", "-DFL_ARRAYFIRE_USE_CPU=ON", \
           "-DFL_BUILD_DISTRIBUTED=OFF", "-DFL_USE_ONEDNN=OFF", "-DFL_BUILD_TESTS=OFF", \
           "-DFL_BUILD_EXAMPLES=OFF", "-DFL_BUILD_SCRIPTS=OFF", "-DBUILD_SHARED_LIBS=ON", \
           *std_cmake_args
    system "make", "-C", "build", "install", "-j$(nproc)"
  end

  test do
    system "false"
  end
end
