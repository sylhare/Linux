#!/bin/bash 
# Docker Installation
# Ubuntu v17.04 or 16.04
# https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/
#
####################
# Custom tutorial script #
####################

# Remove older docker version
sudo apt-get remove docker docker-engine docker.io

# Update  the apt index
sudo apt-get update


# Install install the linux-image-extra-* packages, which allow Docker to use the aufs storage drivers.
sudo apt-get install \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtual

# Install packages for apt to get http packages
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# add repository key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo “-----------------------------------------------------------------------------------”
# Show the key
echo “THE ADDED KEY:”
sudo apt-key fingerprint 0EBFCD88

# check it’s the right one
echo “SHOULD BE THE SAME AS:”
echo “pub   4096R/0EBFCD88 2017-02-22
      Key fingerprint = 9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88
uid                  Docker Release (CE deb) <docker@docker.com>
sub   4096R/F273FCD8 2017-02-22”
echo “-----------------------------------------------------------------------------------”



# Add the stable docker repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Update  the apt index with the docker repository
sudo apt-get update

# See the available versions
apt-cache madison docker-ce
# sudo apt-get install docker-ce=<VERSION>

# Install docker community edition
sudo apt-get install docker-ce

# Check which Docker version have been installed
docker --version

# Make sure Docker was install by running the helloWorld container
sudo docker run hello-world
