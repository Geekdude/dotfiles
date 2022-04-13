##########################################
##     Setup environment variables.     ##
##########################################
set -gx EDITOR vim
set -gx VISUAL vim
set -gx TERM screen-256color
set -gx MAKEFLAGS $MAKEFLAGS -j(nproc)
set -gx MANPATH $HOME/.local/share/man $MANPATH
set -gx BROWSER google-chrome # fix inkscape bug
# umask 077

# Setup autojump.
begin
    set --local AUTOJUMP_PATH /usr/share/autojump/autojump.fish
    if test -e $AUTOJUMP_PATH
        source $AUTOJUMP_PATH
    end
end

# Map capslock to control
if type -q setxkbmap
   setxkbmap -layout us -option ctrl:nocaps -option shift:both_capslock
end

# Map quick press control to escape.
if type -q xcape
   xcape -e 'Control_L=Escape'
end

# Setup mouse if config file exists
if test -e ~/mousecfg.sh
   source ~/mousecfg.sh
end

# Add bin to path if it exists.
if test -e ~/bin; and not contains ~/bin $PATH
   set -x PATH ~/bin $PATH
end

# Add .local bin to path if it exists.
if test -e ~/.local/bin; and not contains ~/.local/bin $PATH
   set -x PATH ~/.local/bin $PATH
end

# Add opt bin to path if it exists.
if test -e ~/opt/bin; and not contains ~/opt/bin $PATH
   set -x PATH ~/opt/bin $PATH
end

# Add snap bin to path if it exists.
if test -e /snap/bin; and not contains /snap/bin $PATH
   set -x PATH /snap/bin $PATH
end

# Add cargo bin to path if it exists. Used by difftastic.
if test -e ~/.cargo/bin; and not contains ~/.cargo/bin $PATH
   set -x PATH ~/.cargo/bin $PATH
end

# Setup Exa alias if installed
if type -q exa
   alias ll "exa -l -g --icons"
   alias lla "ll -a"
end
