#!/bin/sh

# installs dependencies needed to build swift on Ubuntu 14.04 LTS
# adapting instructions from: https://github.com/apple/swift/blob/master/README.md

set -e

# upgrade apt-get
sudo apt-get -yy update && sudo apt-get -yy upgrade

# "For Ubuntu, you'll need the following development dependencies"
sudo apt-get -yy install git cmake ninja-build clang python uuid-dev libicu-dev icu-devtools libbsd-dev libedit-dev libxml2-dev libsqlite3-dev swig libpython-dev libncurses5-dev pkg-config libblocksruntime-dev libcurl4-openssl-dev systemtap-sdt-dev tzdata rsync

echo "Completed successfully."

should_use_tensorflow=false
# ...do something interesting...
if [ "$should_use_tensorflow" = true ] ; then
    # TensorFlow only
    # Bazel TensorFlow requirements: https://docs.bazel.build/versions/master/install-ubuntu.html#install-with-installer-ubuntu
    sudo apt-get -yy install openjdk-8-jdk
    echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list
    curl https://bazel.build/bazel-release.pub.gpg | sudo apt-key add -
fi



