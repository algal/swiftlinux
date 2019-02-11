#!/bin/sh

set -e

# build SWIFT
cd ~
cd swift-source/swift

# make a debug build, and test
should_use_tensorflow=false

# ...do something interesting...
if [ "$should_use_tensorflow" = true ] ; then
    utils/build-script --enable-tensorflow --release-debuginfo
else
    utils/build-script --release-debuginfo
fi


# more info on building only partse of the project in debug mode: https://github.com/apple/swift/blob/master/README.md
