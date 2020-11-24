#!/usr/bin/zsh

# A helper function...
# that returns true if running on OSX
function __osx() {
  # __osx - return if we are running in 'Darwin' (macos)
  [[ $(uname) == "Darwin" ]]
}


function __ubuntu() {
  [[ $(uname) == "Linux" && $(cat /etc/issue | grep -i ubuntu) ]]
}

