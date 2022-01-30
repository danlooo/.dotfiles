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
