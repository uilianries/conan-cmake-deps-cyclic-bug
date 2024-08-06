#!/bin/bash

set -e

echo "****** BUILD PROJECT USING CMAKE DEPS *********"
conan create .

printf "\n===================================================================\n"

echo "****** BUILD PROJECT USING PKG CONFIG DEPS *********"
conan create . -c tools.cmake.cmaketoolchain:extra_variables='{"USE_PKG_CONFIG": "OFF"}'
