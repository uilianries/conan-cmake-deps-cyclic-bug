#!/bin/bash

set -e


echo "****** BUILD PROJECT *********"
conan create . -tf=""

printf "\n===================================================================\n"

echo "****** TEST PROJECT USING CMAKE DEPS *********"
conan test test_package foo/0.1.0

printf "\n===================================================================\n"

echo "****** TEST PROJECT USING PKG CONFIG DEPS *********"
conan test test_package foo/0.1.0 -c tools.cmake.cmaketoolchain:extra_variables='{"USE_PKG_CONFIG": "ON"}'
