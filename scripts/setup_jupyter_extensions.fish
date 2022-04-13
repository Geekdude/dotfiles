#!/usr/bin/fish

echo "Install the jupyter contrib extensions"
pip3 install --user --upgrade jupyter_contrib_nbextensions

echo "Activate the extensions for the current user"
# jupyter nbextensions_configurator enable --user
jupyter contrib nbextension install --user

echo "Create the nbextensions directory"
mkdir -p (jupyter --data-dir)/nbextensions

echo "Install vim binding"
cd (jupyter --data-dir)/nbextensions
git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding
chmod -R go-w vim_binding
cd -

echo "Activate used extensions"
jupyter nbextension enable vim_binding/vim_binding
jupyter nbextension enable toc2/main
jupyter nbextension enable hide_input/main
jupyter nbextension enable toggle_all_line_numbers/main
jupyter nbextension enable contrib_nbextensions_help_item/main
jupyter nbextension enable spellchecker/main
jupyter nbextension enable code_prettify/code_prettify
jupyter nbextension enable livemdpreview/livemdpreview
jupyter nbextension enable execute_time/ExecuteTime
jupyter nbextension enable python-markdown/main
jupyter nbextension enable varInspector/main
jupyter nbextension enable code_prettify/autopep8
jupyter nbextension enable scratchpad/main
jupyter nbextension enable splitcell/splitcell
jupyter nbextension enable scroll_down/main
