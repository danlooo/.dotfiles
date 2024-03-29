#!/usr/bin/env bash

source ~/.shellrc
test -f ~/.local.shellrc && source ~/.local.shellrc
test -f ~/.local.bashrc && source ~/.local.bashrc
source ~/.aliases.sh

eval "$(direnv hook bash)" || :

export PS1="\[\033[38;5;6m\]\u\[$(tput sgr0)\]\[\033[38;5;4m\]@\[$(tput sgr0)\]\[\033[38;5;6m\]\h\[$(tput sgr0)\]\[\033[38;5;4m\]:\[$(tput sgr0)\]\[\033[38;5;6m\]\w\[$(tput sgr0)\]\[\033[38;5;4m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"
