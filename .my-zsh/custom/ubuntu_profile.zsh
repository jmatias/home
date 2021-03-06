#!/usr/bin/zsh

# shellcheck source=./environments.zsh
source $HOME/.my-zsh/custom/environments.zsh

if __ubuntu; then

#  eval "$(starship init zsh)"

  alias bfg="java -jar $HOME/workspace/external-repos/bfg-repo-cleaner/bfg/target/bfg-1.13.0-tags/v1.13.0-2c1ec2f.jar"

  export GTK_THEME=Adwaita:dark
  export MANPATH="$MANPATH:/usr/local/texlive/2021/texmf-dist/doc/man"
  export INFOPATH="$INFOPATH:/usr/local/texlive/2021/texmf-dist/doc/info"
  export PATH=/usr/local/texlive/2021/bin/x86_64-linux:$PATH

  export PATH=$PATH:$HOME/.rbenv/bin
  eval "$(rbenv init -)"

  export PATH="$HOME/.jenv/bin:$PATH"
  eval "$(jenv init -)"

  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

  fpath=($fpath ~/.my-zsh/completions ~/.my-zsh/completions/private /usr/share/zsh/5.7.1/functions)
  rm -f ~/.zcompdump
  autoload -U compinit
  compinit

  # add Pulumi to the PATH
  export PATH=$PATH:$HOME/.pulumi/bin

  PATH="$HOME/perl5/bin${PATH:+:${PATH}}"
  export PATH
  PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
  export PERL5LIB
  PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
  export PERL_LOCAL_LIB_ROOT
  PERL_MB_OPT="--install_base \"$HOME/perl5\""
  export PERL_MB_OPT
  PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"
  export PERL_MM_OPT

  export CATALINA_HOME=/usr/share/tomcat9
  export CATALINA_BASE=/var/lib/tomcat9
  export CATALINA_TMPDIR=/tmp
  export JAVA_OPTS=-Djava.awt.headless=true

  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/extras/CUPTI/lib64:/usr/local/cuda/lib64
  alias stonks="/usr/local/bin/gnucash-cli --quotes get $HOME/Dropbox/Personal/Banking/GnuCash/jmatias_accounting.gnucash"

  #THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
  export SDKMAN_DIR="$HOME/.sdkman"
  [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


  alias openports='sudo ss -tulwn'

  export PYTHONPATH=/usr/local/lib/python3.8/site-packages:$PYTHONPATH
  alias gnucash="gnucash >>$HOME/log/gnucash.log 2>&1 &; disown"
  alias signal-cli='/home/matiasca/workspace/external-repos/signal-cli/build/install/signal-cli/bin/signal-cli'


  export GOROOT=/usr/local/go
  export GOPATH=$HOME/go
  export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

  alias pbcopy=" tr -d '\n' | xclip -selection c"

fi
