function git-reload-hooks-all --description 'Reload all git hooks'
	git submodule foreach --recursive 'rm -f $(git rev-parse --git-dir)/hooks/*;git init'
end
