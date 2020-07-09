alias ls='ls -lha --color'
alias win='cd /c/users/Javier/workspace/ScaledDi'
alias work='cd ~/workspace/ScaledDi'
alias bfg='java -jar /home/matiasca/workspace/bfg-repo-cleaner/bfg/target/bfg-1.13.0-tags/v1.13.0-2c1ec2f.jar'

alias intellij='idea >/dev/null 2>&1 &'
alias zshconfig="idea ~/.zshrc >/dev/null 2>&1 & "
alias ohmyzsh="idea  ~/.oh-my-zsh"
alias zshreload="source ~/.zshrc"
alias awk1='awk '"'"'{print $1}'"'"''
alias awk2='awk '"'"'{print $2}'"'"''
alias awk3='awk '"'"'{print $3}'"'"''
alias awk4='awk '"'"'{print $4}'"'"''
alias awk5='awk '"'"'{print $5}'"'"''

alias weather='curl wttr.in'

function gsquash() {
  commits=$1
  shift
  git reset --soft HEAD~$commits && git commit --edit -m"$(git log --format=%B --reverse HEAD..HEAD@{1})"
}
