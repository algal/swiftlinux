#!/bin/sh

# installs dependencies needed to build swift on Ubuntu 14.04 LTS
# adapting instructions from: https://github.com/apple/swift/blob/master/README.md

set -e

# upgrade apt-get
sudo apt-get -yy update && sudo apt-get -yy upgrade

# "For Ubuntu, you'll need the following development dependencies"
sudo apt-get -yy install git cmake ninja-build clang python uuid-dev libicu-dev icu-devtools libbsd-dev libedit-dev libxml2-dev libsqlite3-dev swig libpython-dev libncurses5-dev pkg-config libblocksruntime-dev libcurl4-openssl-dev systemtap-sdt-dev tzdata rsync

echo "Installing dependencies: Completed successfully."

