class Flashlight < Formula
  desc "Standalone C++ library for machine learning"
  homepage "https://fl.readthedocs.io/en/latest"
  url "https://github.com/flashlight/flashlight/archive/refs/tags/v0.4.0.tar.gz"
  version "0.4.0"
  sha256 "eda197026780a44bff5bfb0d8b747c6a30a092e3d8ab219a88c2b58a23c8ac6a"
  license "MIT"

  depends_on "arrayfire" => :build
  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", "-DFL_ARRAYFIRE_USE_CPU=ON", \
           "-DFL_BUILD_DISTRIBUTED=OFF", "-DFL_USE_ONEDNN=OFF", "-DFL_BUILD_TESTS=OFF", \
           "-DFL_BUILD_EXAMPLES=OFF", "-DFL_BUILD_SCRIPTS=OFF", "-DBUILD_SHARED_LIBS=ON", \
           *std_cmake_args
    ENV.deparallelize
    system "make", "-C", "build", "install"
  end

  test do
    system "false"
  end
end
