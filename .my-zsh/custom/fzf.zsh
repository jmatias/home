# Setup fzf
# ---------
if [[ ! "$PATH" == */home/matiasca/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/matiasca/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/matiasca/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
# source "/home/matiasca/.fzf/shell/key-bindings.zsh"
