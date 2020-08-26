
export ZSH="/home/matiasca/.oh-my-zsh"
ZSH_THEME=""


plugins=(
  git
  fzf
  ripgrep
  kubectl
  common-aliases
  zsh-syntax-highlighting
  history
  zsh-navigation-tools
  aws
  pip
  z
)

export ZSH_CUSTOM="$HOME/.my-zsh/custom"

source $ZSH/oh-my-zsh.sh
