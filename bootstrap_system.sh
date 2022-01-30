#!/usr/bin/env sh

#
# Bootstrap system  - might need root priviliges
#

# debian packages
apt update
apt install -y \
    curl \
    fortune \
    git \
    vim \
    wget \
    zsh

wget https://github.com/gokcehan/lf/releases/download/r26/lf-linux-amd64.tar.gz
tar zxvf lf-linux-amd64.tar.gz
mv lf /usr/local/bin
