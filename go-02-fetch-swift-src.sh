#!/bin/bash

set -e

cd ~
mkdir swift-source
cd swift-source

# Apple's repo
git clone https://github.com/apple/swift.git
./swift/utils/update-checkout --clone "$@"

echo "Completed succesfully"
