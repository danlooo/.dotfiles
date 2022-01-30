#!/usr/bin/env bash

source ~/.aliases.sh

export PS1="\[\033[38;5;6m\]\u\[$(tput sgr0)\]\[\033[38;5;4m\]@\[$(tput sgr0)\]\[\033[38;5;6m\]\h\[$(tput sgr0)\]\[\033[38;5;4m\]:\[$(tput sgr0)\]\[\033[38;5;6m\]\w\[$(tput sgr0)\]\[\033[38;5;4m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"

# additional local run control
# must be executed in same shell to  make variales in this shell available
source <(ls -a $HOME | grep -E '(shell|bash)rc$' | grep -v -E '^.(bash|shell)rc$' | xargs -i cat $HOME/{})
