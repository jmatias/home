#!/usr/bin/zsh

# shellcheck source=./environments.zsh
source $HOME/.my-zsh/custom/environments.zsh

if __osx; then

  alias openports='lsof -i 4tcp'
  alias gnucash='open -a Gnucash'

  PATH="/Users/jmatias/perl5/bin${PATH:+:${PATH}}"; export PATH;
  PERL5LIB="/Users/jmatias/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
  PERL_LOCAL_LIB_ROOT="/Users/jmatias/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
  PERL_MB_OPT="--install_base \"/Users/jmatias/perl5\""; export PERL_MB_OPT;
  PERL_MM_OPT="INSTALL_BASE=/Users/jmatias/perl5"; export PERL_MM_OPT;

  export PATH="/usr/local/opt/python@3.7/bin:$PATH"
  export LDFLAGS="-L/usr/local/opt/python@3.7/lib"
  export PKG_CONFIG_PATH="/usr/local/opt/python@3.7/lib/pkgconfig"

fi
