function! M_search_file()
	let regex_file = input("File to search (regex): ")
	execute "find ./**/" . regex_file
endfunction

function! M_search_word(extension)
	if mode() == 'n'
		execute "vimgrep /" . expand('<cword>') . "/gj ./**/*" . a:extension
		execute "tab +copen"
	elseif mode() == "V"
		execute "'<,' > norm y<CR>gv"
		execute "vimgrep /" . getreg("*") . "/gj ./**/*" . a:extension
	endif
endfunction

function! M_search_fuzzy(extension)
	if mode() == 'n'
		execute "vimgrep /" . expand('<cword>') . "/gjf ./**"
		execute "tab +copen"
	elseif mode() == "V"
		execute "'<,' > norm y<CR>gv"
		execute "vimgrep /" . getreg("*") . "/gjf ./**"
	endif
endfunction

function! M_git_diff(mode)
	if a:mode == "staging"
		execute "!git diff --staged"
	elseif a:mode == "previous"
		execute "!git diff HEAD~"
	elseif a:mode == "specify"
		let file = input("enter file to git diff: ")
		execute "!git diff ./**/" . file
	elseif a:mode == "staging_specify"
		let file = input("enter file to git diff: ")
		execute "!git diff --staged ./**/" . file
	else
		execute "!git diff"
	endif
endfunction

function! M_git_log(mode)
	if a:mode == "graph"
		execute "!git log --oneline --graph"
	elseif a:mode == "commit_count"
		execute "!git rev-list --count"
	elseif a:mode == "diff"
		execute "!git log --patch"
	else
		execute "!git log"
	endif
endfunction

function! M_git_status(mode)
	if a:mode == "short"
		execute "!git status --short"
	elseif a:mode == "check_whitespace"
		execute "!git diff-tree --check $(git hash-object -t tree /dev/null) HEAD"
	else
		execute "!git status"
	endif
endfunction

function! M_git_add(mode)
	if a:mode == "patch"
		execute "!git add -p"
	elseif a:mode == "all"
		execute "!git add ."
	else
		execute "!git add -i"
	endif
endfunction

function! M_git_commit(mode)
	if a:mode == "amend"
		execute "!git commit --amend"
	else
		execute "!git commit"
	endif
endfunction
