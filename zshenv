source ${HOME}/.zsh_files/.zsh.path

# Sometimes I like to keep a history...
export SAVEHIST=2000
export HISTFILE="$HOME/.zsh_files/.zsh.history"

export CVS_RSH=ssh

# Most people are ok with vim
export EDITOR=vim
export VISUAL=vim

# Set up the parameters for 'less' ... and use it
export LESS='-emiSRX'
export PAGER=less

# Don't have the shell check for mail
unset MAIL

# Setup make flags
export MAKEFLAGS="$MAKEFLAGS -j4"

# Setup Browser to fix inkscape bug
export BROWSER=google-chrome
