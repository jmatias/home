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

export PATH=$PATH:/opt/microsoft/msedge-dev


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

export CATALINA_HOME=/usr/share/tomcat9
export CATALINA_BASE=/var/lib/tomcat9
export CATALINA_TMPDIR=/tmp
export JAVA_OPTS=-Djava.awt.headless=true


export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/extras/CUPTI/lib64:/usr/local/cuda/lib64
