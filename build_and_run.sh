#!/usr/bin/env bash

mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Debug ..
make -j
./sse_cmake_exercise ../yamlParser/config.yml
