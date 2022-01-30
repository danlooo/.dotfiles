#!/usr/bin/env zsh

#
# Bootstrap user space. No root here!
#

REPO_DIR="$HOME/.dotfiles"

# Oh my zsh
rm -rf ~/.oh-my-zsh
curl https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh

# powerlevel10
mkdir -p ~/.local/share/fonts
wget -O ~/.local/share/fonts/MesloLGS NF Regular.ttf \
    https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget -O ~/.local/share/fonts/MesloLGS NF Bold.ttf \
    https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget -O ~/.local/share/fonts/MesloLGS NF Italic.ttf \
    https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget -O ~/.local/share/fonts/MesloLGS NF Bold Italic.ttf \
    https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# dotfiles
# do as last step because ohmyzsh overwrites .zshrc
cd $HOME
dotfiles=$(find "$REPO_DIR/home" -type f | cut -sd / -f 6-)
mkdir -p  ~/.config
echo $dotfiles | xargs -i rm -rf $HOME/{}
# only  do soft links so one can also replace some  files locally  independed of the git repo
echo $dotfiles | xargs -i ln -s $REPO_DIR/home/{} $HOME/{}

exec zsh