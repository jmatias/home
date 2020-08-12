#!/usr/bin/zsh

export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

export KUBE_EDITOR='code --wait'

export PATH=/usr/local/sbt/bin:$PATH
export PATH=$HOME/bin/:$PATH
export PATH=$HOME/devcli/:$PATH

export SPARK_HOME=/opt/spark
export PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin
export SPARK_MASTER_WEBUI_PORT=8081

export PATH=$PATH:/opt/zeppelin/zeppelin-0.9.0-preview1-bin-all/bin/
export PATH=$PATH:/usr/local/sonar-scanner/bin
export PATH=/usr/local/sbt/bin:$PATH

export PATH="$PATH:/home/matiasca/anaconda3/bin"

export COMPLETION_WAITING_DOTS="true"
export HYPHEN_INSENSITIVE="true"
export FLUX_FORWARD_NAMESPACE=flux

fpath=($fpath ~/.my-zsh/completions ~/.my-zsh/completions/private)
rm -f ~/.zcompdump
autoload -U compinit
compinit
eval "$(starship init zsh)"

export DISABLE_AUTO_TITLE="true"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

mkdir -p $ZSH_CUSTOM/secret
touch $ZSH_CUSTOM/secret/secret.zsh
source $ZSH_CUSTOM/secret/secret.zsh

bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

set +e

source $HOME/.env3/bin/activate

export AWS_PAGER=""
export RPROMPT=""


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!

function conda-start {

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

}
# <<< conda initialize <<<


export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/extras/CUPTI/lib64