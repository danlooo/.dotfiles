# .dotfiles

## Install

```sh
git clone  https://github.com/danlooo/dotfiles ~/.dotfiles
sudo sh /.dotfiles/bootstrap_system.sh # install packages
sh ~/.dotfiles/bootstrap_user.sh # install configs
exec zsh
```

## Contribute

-  Install packages and do system wide changes which  might  need root privileges: [bootstrap_system.sh](bootstrap_system.sh)
-  Install user packages and link  dotfiles:  [bootstrap_user.zsh](bootstrap_user.zsh)
-  User  dotfiles relative to the home directory of that user: [home](home)