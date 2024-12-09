# -----------------------------------------------
# Init environment variables
# -----------------------------------------------

set -gx PATH /usr/lib/ccache/bin/:$PATH
set -gx PATH $HOME/.local/bin:$PATH

set -gx PATH $HOME/.cargo/bin:$PATH

# Set Perl environment variables
set -gx PATH /home/Bing/perl5/bin $PATH
set -gx PERL5LIB /home/Bing/perl5/lib/perl5 $PERL5LIB
set -gx PERL_LOCAL_LIB_ROOT /home/Bing/perl5 $PERL_LOCAL_LIB_ROOT
set -gx PERL_MB_OPT "--install_base \"/home/Bing/perl5\""
set -gx PERL_MM_OPT "INSTALL_BASE=/home/Bing/perl5"
