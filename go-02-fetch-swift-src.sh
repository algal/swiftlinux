#!/bin/sh

set -e

cd ~
mkdir swift-source
cd swift-source

should_use_tensorflow=false
# ...do something interesting...
if [ "$should_use_tensorflow" = true ] ; then
    # Apple's repo
    git clone https://github.com/apple/swift.git -b tensorflow
    ./swift/utils/update-checkout --clone --scheme tensorflow
else
    # Apple's repo
    git clone https://github.com/apple/swift.git
    ./swift/utils/update-checkout --clone
fi


echo "Completed succesfully"
