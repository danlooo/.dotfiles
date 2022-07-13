# .dotfiles <img src='.logo.png' align="right" height="138.5" />

This repository  is to automatically install  packages and user configuration on a new system  in [my](https://github.com/danlooo) preferred way.

## Get started

Install:

```sh
cd
git clone  https://github.com/danlooo/.dotfiles
cd .dotfiles
sudo sh bootstrap_system.sh 
zsh bootstrap_user.zsh 
exec zsh
```

## Contribute

-  Install packages and do system wide changes which  might  need root privileges: [bootstrap_system.sh](bootstrap_system.sh)
-  Install user packages and link  dotfiles:  [bootstrap_user.zsh](bootstrap_user.zsh)
-  User  dotfiles relative to the home directory of that user: [home](home)
-  Create additional run control files e.g.  `~/foo.zshrc` will be sourced if available where `foo` can be any prefix. By default, files like  `~/.local.zshrc` will be touched. These files are ment for local customizations and therefore not under version control