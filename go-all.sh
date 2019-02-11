#!/bin/bash

set -e

./go-01-install-swift-dev-deps.sh
./go-02-fetch-swift-src.sh "$@"
./go-03-build.sh
exit $?
