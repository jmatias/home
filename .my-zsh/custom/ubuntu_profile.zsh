#!/usr/bin/zsh

# shellcheck source=./environments.zsh
source $HOME/.my-zsh/custom/environments.zsh

if __ubuntu; then
  export GTK_THEME=Adwaita:dark
  export MANPATH="$MANPATH:/usr/local/texlive/2021/texmf-dist/doc/man"
  export INFOPATH="$INFOPATH:/usr/local/texlive/2021/texmf-dist/doc/info"
  export PATH=/usr/local/texlive/2021/bin/x86_64-linux:$PATH

  export PATH=$PATH:$HOME/.rbenv/bin
  eval "$(rbenv init -)"

  export PATH="$HOME/.jenv/bin:$PATH"
  eval "$(jenv init -)"

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
  alias stonks='/usr/local/bin/gnucash-cli --quotes get /mnt/dropbox/Banking/GnuCash/jmatias_accounting.gnucash'

  #THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
  export SDKMAN_DIR="$HOME/.sdkman"
  [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


  alias openports='sudo ss -tulwn'

fi
