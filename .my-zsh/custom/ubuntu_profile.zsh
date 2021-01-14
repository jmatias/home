#!/usr/bin/zsh

# add Pulumi to the PATH
export PATH=$PATH:$HOME/.pulumi/bin

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/matiasca/.sdkman"
[[ -s "/home/matiasca/.sdkman/bin/sdkman-init.sh" ]] && source "/home/matiasca/.sdkman/bin/sdkman-init.sh"

PATH="/home/matiasca/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/matiasca/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/matiasca/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/matiasca/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/matiasca/perl5"; export PERL_MM_OPT;
