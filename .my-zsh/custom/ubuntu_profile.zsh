#!/usr/bin/zsh

# shellcheck source=./environments.zsh
source $HOME/.my-zsh/custom/environments.zsh

if  __ubuntu; then

  devcli weather

  # add Pulumi to the PATH
  export PATH=$PATH:$HOME/.pulumi/bin

  PATH="/home/matiasca/perl5/bin${PATH:+:${PATH}}"
  export PATH
  PERL5LIB="/home/matiasca/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
  export PERL5LIB
  PERL_LOCAL_LIB_ROOT="/home/matiasca/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
  export PERL_LOCAL_LIB_ROOT
  PERL_MB_OPT="--install_base \"/home/matiasca/perl5\""
  export PERL_MB_OPT
  PERL_MM_OPT="INSTALL_BASE=/home/matiasca/perl5"
  export PERL_MM_OPT

  export CATALINA_HOME=/usr/share/tomcat9
  export CATALINA_BASE=/var/lib/tomcat9
  export CATALINA_TMPDIR=/tmp
  export JAVA_OPTS=-Djava.awt.headless=true

  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/extras/CUPTI/lib64:/usr/local/cuda/lib64

  #THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
  export SDKMAN_DIR="/home/matiasca/.sdkman"
  [[ -s "/home/matiasca/.sdkman/bin/sdkman-init.sh" ]] && source "/home/matiasca/.sdkman/bin/sdkman-init.sh"

  alias stonks='/usr/local/bin/gnucash-cli --quotes get /e/Dropbox/GNU\ Cash/jmatias_accounting.gnucash'

fi
