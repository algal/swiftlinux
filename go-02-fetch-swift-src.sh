#!/bin/sh

set -e

cd ~
mkdir swift-source
cd swift-source

git clone https://github.com/apple/swift.git
./swift/utils/update-checkout --clone
echo "Completed succesfully"
