#!/bin/sh

# installs dependencies needed to build swift on Ubuntu 14.04 LTS
# adapting instructions from: https://github.com/apple/swift/blob/master/README.md

set -e

# upgrade apt-get

sudo apt-get -yy update && sudo apt-get -yy upgrade

# "For Ubuntu, you'll need the following 
# development dependencies"
#
# (we exclude cmake, to add the needed version manually)

sudo apt-get -yy install git ninja-build clang python uuid-dev libicu-dev icu-devtools libbsd-dev libedit-dev libxml2-dev libsqlite3-dev swig libpython-dev libncurses5-dev pkg-config libblocksruntime-dev libcurl4-openssl-dev

# "If you are building on Ubuntu 14.04 LTS, 
# you'll need to upgrade your clang compiler 
# for C++14 support and create a symlink"

sudo apt-get install -y clang-3.6
sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-3.6 100
sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-3.6 100

# "CMake is the core infrastructure used to configure builds of Swift
# and its companion projects; at least version 3.4.3 is required."

sudo apt-get install -y curl
curl -sSL https://cmake.org/files/v3.6/cmake-3.6.2-Linux-x86_64.tar.gz | sudo tar -xzC /opt
echo "Linking to cmake executables from /usr/local/bin"
sudo ln -s -t /usr/local/bin/ /opt/cmake-3.6.2-Linux-x86_64/bin/* 
echo "Completed successfully."
