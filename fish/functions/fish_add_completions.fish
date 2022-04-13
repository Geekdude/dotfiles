function fish_add_completions --description 'Convert a program help into a man page and reload completions.'
   help2man --version-string=1.0 --no-discard-stderr $argv > ~/.local/share/man/man1/(basename $argv).1
   fish_update_completions
end
