function git-add-submodule --description 'Add an existing submodule to the git repository'
   if set -q url
      echo Error: url variable name already used.
      return
   end

   pushd $argv
   if test -d .git
      set url (git remote get-url origin)
   end
   popd
   if set -q url
      echo git submodule add $url $argv
      git submodule add $url $argv
   else
      echo The target folder is not a git directory.
   end
end
