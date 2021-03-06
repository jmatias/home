#!/usr/bin/zsh

. $ZSH_CUSTOM/environments.zsh

if __ubuntu; then
  alias ls='ls -lha --color'
elif __osx; then
  alias ls='ls -lhaG'
fi

alias work='cd ~/workspace'

function intellij() {
  if [[ $# -gt 0 ]]; then
    idea $1 >/dev/null 2>&1 &
  else
    idea >/dev/null 2>&1 &
  fi

  disown
}

function clion() {
  if [[ $# -gt 0 ]]; then
    $HOME/bin/clion $1 >/dev/null 2>&1 &
  else
    $HOME/bin/clion >/dev/null 2>&1 &
  fi

  disown
}

alias jbt='jetbrains-toolbox >/dev/null 2>&1 &; disown'
alias msedge='msedge >/dev/null 2>&1 &; disown'
alias startgui='startxfce4 >/dev/null 2>&1 &; disown'

function eclip() {
  eclipse >/dev/null 2>&1 &
  disown
}

alias firefox='firefox >/dev/null 2>&1 &; disown'
alias zshconfig="idea ~/.zshrc >/dev/null 2>&1 & "
alias ohmyzsh="idea  ~/.oh-my-zsh"
zshreload() { while (($#)); do
  unfunction $1
  autoload -U $1
  shift
done; }
alias reload='source ~/.zshrc'

alias awk1='awk '"'"'{print $1}'"'"''
alias awk2='awk '"'"'{print $2}'"'"''
alias awk3='awk '"'"'{print $3}'"'"''
alias awk4='awk '"'"'{print $4}'"'"''
alias awk5='awk '"'"'{print $5}'"'"''
alias awk6='awk '"'"'{print $6}'"'"''
alias awk7='awk '"'"'{print $7}'"'"''
alias awk8='awk '"'"'{print $8}'"'"''
alias awk9='awk '"'"'{print $9}'"'"''
alias awk10='awk '"'"'{print $10}'"'"''
alias awk11='awk '"'"'{print $11}'"'"''

alias weather="curl 'wttr.in/NYC?m'"

function gsquash() {
  commits=$1
  shift
  git reset --soft HEAD~$commits && git commit --edit -m"$(git log --format=%B --reverse HEAD..HEAD@{1})"
}

alias please='sudo'
alias envs='env | sort'

function decode() {
  echo $1 | base64 -d
}

function encode() {
  echo $1 | base64
}

function humanread() {
  numfmt --to=iec-i --suffix=B --padding=7 $1
}

function hnv() {
  hn view $1
}


alias hnt='hn top'
alias mtail='multitail -cS amir_log'
alias rstudio='QMLSCENE_DEVICE=softwarecontext rstudio >/dev/null 2>&1 &; disown'
alias psgrep='ps aux | grep'
alias openports='sudo ss -tulwn'
alias byeee='please shutdown -r now'
alias update-starship='sh -c "$(curl -fsSL https://starship.rs/install.sh)"'
