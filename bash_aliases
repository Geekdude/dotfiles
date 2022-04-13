alias zork='frotz ~/Zorks/Zork/DATA/ZORK1.DAT'
alias zork2='frotz ~/Zorks/Zork2/DATA/ZORK2.DAT'
alias zork3='frotz ~/Zorks/Zork3/DATA/ZORK3.DAT'
#alias ifconfig.me='curl ifconfig.me'
alias ifconfig.me='dig +short myip.opendns.com @resolver1.opendns.com'
alias lock='gnome-screensaver-command -l'
alias restore_background="gsettings set org.gnome.settings-daemon.plugins.background active true"

set-title(){
  ORIG=$PS1
  TITLE="\e]2;$@\a"
  PS1=${ORIG}${TITLE}
}

gvim () { command gvim --remote-tab-silent "$@" || command gvim "$@"; }
