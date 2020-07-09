# PROMPT='$(kube_ps1)'$PROMPT
# kubeoff

export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

export KUBE_EDITOR='code --wait'

export PATH=/opt/idea-IU-201.7223.91/bin:$PATH
export PATH=/usr/local/sbt/bin:$PATH
export PATH=/home/matiasca/bin/:$PATH
export PATH=/home/matiasca/devcli/:$PATH

export PATH=$PATH:/usr/local/sonar-scanner/bin

chmod 700 ~/.ssh/jumpbox/trusted-infra-creators.pem

export COMPLETION_WAITING_DOTS="true"
export HYPHEN_INSENSITIVE="true"
export FLUX_FORWARD_NAMESPACE=flux

export CR_OWNER=***REMOVED***
export CR_GIT_REPO=helm-charts
export CR_CHARTS_REPO=https://github.com/***REMOVED***/helm-charts
export CR_PACKAGE_PATH=deploy
export CR_GIT_BASE_URL="https://api.github.com/"
export CR_GIT_UPLOAD_URL="https://uploads.github.com/"

autoload -U compinit
compinit
fpath=($fpath ~/.my-zsh/completions ~/.my-zsh/completions/private)
eval "$(starship init zsh)"

export DISABLE_AUTO_TITLE="true"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

source $ZSH_CUSTOM/secret/secret.zsh

bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

set +e

if [ ! -f "$HOME/.env3/bin/activate" ]; then
  echo "Creating Python 3 virtual environment"
  python3 -m venv ~/.env3
fi

source $HOME/.env3/bin/activate

#function uaws() {
#  unset AWS_ACCESS_KEY_ID
#  unset AWS_SECRET_ACCESS_KEY
#  unset AWS_SESSION_TOKEN
#  unset AWS_EXPIRATION
#  #  unset AWS_PROFILE
#}

export AWS_PAGER=""

function awssource() {
  source $HOME/.zshenv
}
add-zsh-hook precmd awssource
