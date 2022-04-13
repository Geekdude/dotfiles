function git-reload-hooks --description 'Reload git hooks'
   rm -f (git rev-parse --git-dir)/hooks/*
   git init
end
