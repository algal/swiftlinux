#!/bin/sh

set -e

# build SWIFT
cd ~
cd swift-source/swift

utils/build-script --release

# more info on building only partse of the project in debug mode: https://github.com/apple/swift/blob/master/README.md
