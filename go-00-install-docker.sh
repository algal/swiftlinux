#!/bin/sh

set -e

# Install latest version of Docker on Ubuntu 14.04 LTS

# https://docs.docker.com/engine/installation/linux/ubuntulinux/

# install linux image extras to allow aufs

sudo apt-get update
sudo apt-get -y install linux-image-extra-$(uname -r) linux-image-extra-virtual

# Update apt sources

sudo apt-get update
sudo apt-get -y install apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" | sudo tee /etc/apt/sources.list.d/docker.list

# Install docker

sudo apt-get update
sudo apt-get -y install docker-engine
sudo service docker start || true
sudo docker run hello-world

# Create docker group

sudo groupadd docker || true
sudo usermod -aG docker $USER

# logout/login to take effect
echo "Completed successfully. Please logout/login for docker user group changes to take effect so you can invoke docker without sudo"

