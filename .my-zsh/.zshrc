
export ZSH="/home/matiasca/.oh-my-zsh"
ZSH_THEME=""


plugins=(
  git
  kubectl
  common-aliases
  zsh-syntax-highlighting
  history
  zsh-navigation-tools
  aws
  z
)

export SHOW_AWS_PROMPT=false
export ZSH_CUSTOM=$HOME/.my-zsh/custom

source $ZSH/oh-my-zsh.sh


