#!/usr/bin/env sh

#
# Bootstrap system  - might need root priviliges
#

# debian packages
apt update
DEBIAN_FRONTEND=noninteractive apt install -y \
    curl \
    direnv \
    fortune \
    git \
    htop \
    vim \
    wget \
    xdg-utils \
    zsh \
    rclone

wget https://github.com/gokcehan/lf/releases/download/r26/lf-linux-amd64.tar.gz
tar zxvf lf-linux-amd64.tar.gz
mv lf /usr/local/bin
