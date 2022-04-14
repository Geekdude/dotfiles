#!/bin/bash

sudo apt update
sudo apt upgrade
sudo apt install git git-gui vim-gtk3 tmux fish build-essential meld tree exuberant-ctags curl \
   valgrind kcachegrind ncdu htop glances \
   python3 python3-venv python3-pip \
   texlive-full pdf-presenter-console pandoc graphviz ripgrep rename \
   linux-tools-common linux-tools-generic linux-tools-`uname -r` \
   ninja-build ruby-full cmake meson iperf3 \
   peco frotz
