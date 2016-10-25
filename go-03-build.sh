#!/bin/sh

set -e

cd ~
cd swift-source/swift

# make a debug build, and test
utils/build-script -t
