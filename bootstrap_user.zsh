#!/usr/bin/env zsh

#
# Bootstrap user space. No root here!
#

REPO_DIR="$HOME/.dotfiles"

# Oh my zsh
rm -rf ~/.oh-my-zsh ~/.zshrc*
curl https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh

# powerlevel10
mkdir -p ~/.local/share/fonts
wget -O ~/.local/share/fonts/MesloLGS\ NF\ Regular.ttf \
    https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget -O ~/.local/share/fonts/MesloLGS\ NF\ Bold.ttf \
    https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget -O ~/.local/share/fonts/MesloLGS\ NF\ Italic.ttf \
    https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget -O ~/.local/share/fonts/MesloLGS\ NF\ Bold Italic.ttf \
    https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# vim
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

# dotfiles
# do as last step because ohmyzsh overwrites .zshrc
cd $HOME
dotfiles=$(find "$REPO_DIR/home" -type f | cut -sd / -f 6-)

# create dirs if  required
find "$REPO_DIR/home" -type d | cut -sd / -f 6- | xargs -i mkdir -p ~/{}

# remove existing repo files
echo $dotfiles | xargs -i rm -rf $HOME/{}

# only  do soft links so one can also replace some  files locally  independed of the git repo
echo $dotfiles | xargs -i ln -s $REPO_DIR/home/{} {}

# additional local run control
touch $HOME/.local.zshrc $HOME/.local.shellrc $HOME/.local.bashrc

# start docker container
COMPOSE_PROJECT_NAME=main GID=$GID UID=$UID \
    docker-compose -f $HOME/.docker-compose.yml \
    --env-file /dev/null \
    up --detach

# gsettings
gsettings set org.gnome.nautilus.preferences always-use-location-entry true

exec zsh
