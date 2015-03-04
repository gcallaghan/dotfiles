[ -n "$PS1" ] && source ~/.bash_profile;

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

PERL_MB_OPT="--install_base \"/Users/grant/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/grant/perl5"; export PERL_MM_OPT;
