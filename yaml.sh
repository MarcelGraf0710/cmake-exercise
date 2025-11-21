#!/usr/bin/env bash

mkdir yaml && cd yaml

# config yamlcpp

YAMLCPP_VERSION="0.6.3"
YAMLCPP_TAR_GZ="yaml-cpp-${YAMLCPP_VERSION}.tar.gz"
YAMLCPP_URL="https://github.com/jbeder/yaml-cpp/archive/refs/tags/${YAMLCPP_TAR_GZ}"
PREFIX_DIR="$(pwd)/yaml-cpp-${YAMLCPP_VERSION}"

# download yamlcpp
mkdir -p build
wget -O "build/${YAMLCPP_TAR_GZ}" "${YAMLCPP_URL}"
tar -xzf "build/${YAMLCPP_TAR_GZ}" -C build

# build yamlcpp
mkdir -p "build/yaml-cpp-build-${YAMLCPP_VERSION}" "${PREFIX_DIR}"

cmake -S "build/yaml-cpp-yaml-cpp-${YAMLCPP_VERSION}" -B "build/yaml-cpp-build-${YAMLCPP_VERSION}" \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX="${PREFIX_DIR}" \
  -DYAML_BUILD_SHARED_LIBS=ON \
  -DYAML_BUILD_TESTS=OFF \
  -DYAML_BUILD_TOOLS=OFF
cmake --build "build/yaml-cpp-build-${YAMLCPP_VERSION}" --target install -j

echo "Installed yaml-cpp at ${PREFIX_DIR}"