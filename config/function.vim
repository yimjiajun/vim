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

function! M_terminal(mode)
	if a:mode == "split"
		execute "term"

	elseif a:mode =="vertical"
		execute "vert term"
	else
		execute "tab term"
	end
endfunction

function! M_buffer(mode)
	if a:mode == "list"
		execute "ls"
	end
endfunction
