#!/usr/bin/zsh

# shellcheck source=./environments.zsh
source $HOME/.my-zsh/custom/environments.zsh

if __osx; then

  alias openports='lsof -i 4tcp'

fi
