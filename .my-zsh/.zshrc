
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
  z
)

export ZSH_CUSTOM="$HOME/.my-zsh/custom"

source $ZSH/oh-my-zsh.sh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/matiasca/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/matiasca/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/matiasca/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/matiasca/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

