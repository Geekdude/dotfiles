# Install Ruby Gems to ~/gems
if test -e $HOME/gems/bin
   set -gx GEM_HOME $HOME/gems
   set -gx PATH $HOME/gems/bin $PATH
end

if test -e $HOME/.rbenv/bin
   set -gx PATH $HOME/.rbenv/bin $PATH
end
