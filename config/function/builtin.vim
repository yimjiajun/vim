function! M_search_file()
	if g:loaded_fzf_vim == "1"
		execute "Files"
	else
		let regex_file = input("File to search (regex): ")
		execute "find ./**/" . regex_file
	endif
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
	if g:loaded_fzf_vim == "1"
		execute "Rg"
	else
		let word=input("Enter word to search: ")
		if mode() == 'n'
			if empty(word)
				let word = expand('<cword>')
			endif
			execute "vimgrep /" . word . "/gjf ./**"
			execute "tab +copen"
		elseif mode() == "V"
			if empty(word)
				let word = getreg("*")
			endif
			execute "'<,' > norm y<CR>gv"
			execute "vimgrep /" . word . "/gjf ./**"
		endif

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
	if g:loaded_fzf_vim == "1"
		if a:mode == "list"
			execute "Buffers"

		endif
	else
		if a:mode == "list"
			execute "ls"
		endif
	endi
endfunction

function! M_marks(mode)
	if g:loaded_fzf_vim == "1"
		execute "Marks"
	else
		execute "marks"
	endif
endfunction

function! M_statusline(mode)
	if a:mode == "ascii"
		set statusline=\ %<%f%h%m%r%=%b\ 0x%B\ \ %l,%c%V\ %P
	elseif a:mode == "byte"
		set statusline=\ %<%f%=\ [%1*%M%*%n%R%H]\ %-19(%3l,%02c%03V%)%O'%02b'
	else
		set statusline=\ %<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
	endif
endfunction
