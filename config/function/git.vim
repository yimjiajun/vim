function! M_git_get_cmd_plugin()
	if exists(":FloatermNew")
		return "FloatermNew --width=0.9 --height=0.9" . " git "
	endif

	if exists(":Git")
		return "Git"
	endif

	return "!git"
endfunction

function! M_git_diff(mode)
	let cmd = M_git_get_cmd_plugin()
	if a:mode == "staging"
		execute cmd . ' ' . "diff --staged"
	elseif a:mode == "previous"
		execute cmd . ' ' . "diff HEAD~"
	elseif a:mode == "specify"
		let file = input("enter file to git diff: ")
		execute cmd . ' ' . "diff ./**/" . file
	elseif a:mode == "staging_specify"
		let file = input("enter file to git diff: ")
		execute cmd . ' ' . "diff --staged ./**/" . file
	else
		execute cmd . ' ' . "diff"
	endif
endfunction

function! M_git_log(mode)
	let cmd = M_git_get_cmd_plugin()
	if a:mode == "graph"
		execute cmd . ' ' . "log --oneline --graph"
	elseif a:mode == "commit_count"
		execute cmd . ' ' . "rev-list --count"
	elseif a:mode == "diff"
		execute cmd . ' ' . "log --patch"
	else
		execute cmd . ' ' . "log"
	endif
endfunction

function! M_git_status(mode)
	let cmd = M_git_get_cmd_plugin()
	if a:mode == "short"
		execute cmd . ' ' . "status --short"
	elseif a:mode == "check_whitespace"
		execute cmd . ' ' . "diff-tree --check $(git hash-object -t tree /dev/null) HEAD"
	else
		if g:loaded_fzf_vim == "1"
			execute "GFiles?"
		else
			execute cmd . ' ' . "status"
		endif
	endif
endfunction

function! M_git_add(mode)
	let cmd = M_git_get_cmd_plugin()
	if a:mode == "patch"
		execute cmd . ' ' . "add -p"
	elseif a:mode == "all"
		execute cmd . ' ' . "add ."
	else
		execute cmd . ' ' . "add -i"
	endif
endfunction

function! M_git_commit(mode)
	let cmd = M_git_get_cmd_plugin()
	if a:mode == "amend"
		execute cmd . ' ' . "commit --amend"
	else
		execute cmd . ' ' . "commit"
	endif
endfunction
