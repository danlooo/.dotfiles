#!/usr/bin/env bash

sudo apt update

cat .packages.apt | grep -v -E '^#' | xargs apt install -y
cat .packages.snap | grep -v -E '^#' | xargs snap install
cat .packages.npm | grep -v -E '^#' | xargs npm install -y
cat .packages.pip3 | grep -v -E '^#' | xargs pip3 install

install_r_package() {
	R --no-rc --vanilla -e "install.packages('$1', repos='http://cran.r-project.org')"
}
export -f install_r_package
cat .packages.r | grep -v -E '^#' | xargs -I {} bash -c 'install_r_package "$@"' _ {}

