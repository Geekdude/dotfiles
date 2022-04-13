#! /bin/bash

# Add sudo if needed.
SUDO=''
if (( $EUID != 0 )); then
    SUDO='sudo'
fi
# $SUDO a_command

cd ~
echo 'Install asciidoc'
$SUDO apt install asciidoc
echo 'clone git-latexdiff'
git clone https://gitlab.com/git-latexdiff/git-latexdiff.git
cd git-latexdiff
echo 'Install git-latexdiff'
$SUDO make install
cd ~
echo 'Remove git-latexdiff'
rm -rf git-latexdiff
