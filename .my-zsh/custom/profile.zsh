#umask 022

# if [[ "$(umask)" = "0000" ]]; then
# 	  umask 0022
#   fi

alias ls='ls -lha --color'
alias win='cd /c/users/Javier/workspace/ScaledDi'
alias work='cd ~/workspace/ScaledDi'
alias bfg='java -jar /home/matiasca/workspace/bfg-repo-cleaner/bfg/target/bfg-1.13.0-tags/v1.13.0-2c1ec2f.jar'
# PROMPT='$(kube_ps1)'$PROMPT
# kubeoff


export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

export PATH=/opt/idea-IU-201.7223.91/bin:$PATH
export PATH=/usr/local/sbt/bin:$PATH
export PATH=/home/matiasca/bin/:$PATH

export SONAR_HOST_URL="http://sonar.***REMOVED***.k8.***REMOVED***.com"


export PATH=$PATH:/usr/local/sonar-scanner/bin

alias intelli='idea >/dev/null 2>&1 &'
alias zshconfig="idea ~/.zshrc >/dev/null 2>&1 & "
alias ohmyzsh="idea  ~/.oh-my-zsh"
alias zshreload="source ~/.zshrc"

chmod 700 ~/.ssh/jumpbox/trusted-infra-creators.pem

export COMPLETION_WAITING_DOTS="true"
export HYPHEN_INSENSITIVE="true"
export FLUX_FORWARD_NAMESPACE=flux


function uaws() {
unset AWS_ACCESS_KEY_ID
unset AWS_SECRET_ACCESS_KEY
unset AWS_SESSION_TOKEN
unset AWS_EXPIRATION
unset AWS_PROFILE
}





#function awssource() {
#	uaws
#	source  ~/.oh-my-zsh/custom/aws.zsh
#}
#add-zsh-hook precmd awssource

autoload -U compinit
compinit
fpath=($fpath ~/.oh-my-zsh/completions)
eval "$(starship init zsh)"


export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
# export LC_CTYPE=en_US.UTF-8
# export LC_NUMERIC=en_US.UTF-8
# export LC_TIME=en_US.UTF-8
# export LC_COLLATE=en_US.UTF-8
# export LC_MONETARY=en_US.UTF-8
# export LC_MESSAGES=en_US.UTF-8
# export LC_PAPER=en_US.UTF-8
# export LC_NAME=en_US.UTF-8
# export LC_ADDRESS=en_US.UTF-8
# export LC_TELEPHONE=en_US.UTF-8
# export LC_MEASUREMENT=en_US.UTF-8
# export LC_IDENTIFICATION=en_US.UTF-8

# bindkey "OD" backward-word
# bindkey "OC" forward-word


#bindkey '\e[A' history-beginning-search-backward
#bindkey '\e[B' history-beginning-search-forward
