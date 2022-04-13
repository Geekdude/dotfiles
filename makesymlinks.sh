#!/bin/bash
################################################################################
# makesymlinks.sh
# This script creates symlinks from the home directory to any desired dotfiles
# in ~/dotfiles.
################################################################################

########## Variables

dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd ) # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bash_aliases bashrc gitconfig git_template gitignore_global tmux.conf tmux vim vimrc zshrc zshenv zsh_files oh-my-zsh zsh_custom ssh fzf fonts.conf"    # list of files/folders to symlink in homedir
vim_plug="calendar-vim ctrlp.vim DoxygenToolkit.vim fzf.vim goyo.vim LanguageTool notational-fzf-vim supertab taboo.vim tabular tagbar thesaurus_query.vim undotree vim-abolish vim-autocorrect vim-buffergator vim-capslock vim-commentary vim-dict vim-exchange vim-fish vim-flake8 vim-gdscript3 vim-gitgutter vim-HiLinkTrace vim-instant-markdown vim-pencil vim-rename vim-repeat vim-surround vimtex vim-textobj-entire vim-textobj-sentence vim-textobj-user vim-unimpaired vim-vinegar vim-visual-star-search vimwiki vim-zettel cheat.sh-vim" # List of vim plugin subdirectories to use.
submod="fzf tmux/plugins/tpm inkscape_extensions reorder" # List of additional submodules to use.

##########

# # create dotfiles_old in homedir
# echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
# mkdir -p $olddir
# echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# Init used vim submodules
for file in $vim_plug; do
   echo "Initializing vim plugin $file."
   git submodule update --recursive --init vim/bundle/$file
done

# Init other submodules
for file in $submod; do
   echo "Initializing other submodules $file."
   git submodule update --recursive --init $file
done

# Update all the submodules
echo -n "Updated all of the submodules ..."
git submodule update --recursive
echo "done"

# Move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    # echo "Moving any existing dotfiles from ~ to $olddir"
    # mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -Tsf $dir/$file ~/.$file
done

# Move bin scripts to bin folder
mkdir -p ~/bin
mkdir -p ~/opt/bin
for file in bin/*; do
   echo "Creating symlink to $file in bin directory."
   ln -sf $dir/$file ~/bin
done

# Copy Desktop files
echo "Creating symlink to desktop files in .local/share/applications."
rm -f ~/.local/share/applications/gvim.desktop
ln -sf $dir/gvim.desktop ~/.local/share/applications/gvim.desktop

# Setup sym links for fonts
echo "Creating sym links for fonts"
ln -sTf $dir/fonts ~/.local/share/fonts
fc-cache -fv

# Create .config folder
mkdir -p ~/.config

# Setup sym links for neovim
echo "Creating symlinks for neovim."
ln -sTf ~/.vim ~/.config/nvim
ln -sf ~/.vimrc ~/.config/nvim/init.vim

# Setup sym links for fish
echo "Creating Symlinks for fish."
ln -sTf $dir/fish ~/.config/fish
ln -sTf $dir/omf ~/.config/omf

# Setup sym links for terminator
echo "Creating symlinks for terminator."
ln -sTf $dir/terminator ~/.config/terminator

# Setup sym links for Okular
echo "Creating symlinks for Okular."
ln -sf -t ~/.kde/share/apps/okular/ ~/Data/Dropbox/okular/docdata

# Setup sym links for LanguageTool
echo "Setting up LanguageTool"
ln -sTf $dir/LanguageTool-4.0 ~/LanguageTool-4.0

# Install Inkscape extensions
echo "Setting up Inkscape Extensions."
mkdir -p ~/.config/inkscape
ln -sTf $dir/inkscape_extensions ~/.config/inkscape/extensions

# Install fzf
~/.fzf/install --all

# # Install YouCompleteMe
# cd $dir/vim/bundle/YouCompleteMe
# git submodule update --init --recursive
# python3 install.py --clang-completer
# cd -

# Decrypt id_rsa
# To encrypt use `gpg -c id_rsa`
if [ ! -f ssh/id_rsa ]; then
   gpg ssh/id_rsa.gpg
fi

# Install cht.sh
echo -n "Installing cht.sh"
mkdir -p ~/bin/
curl https://cht.sh/:cht.sh > ~/bin/cht.sh
chmod +x ~/bin/cht.sh
