let g:build_cmd_list = [
	\ { 'name': 'Vim',
	\   'cmd': 'vim --version'
	\},
\]

function! M_search_file()
	let regex_file = input("File to search (regex): ")
	execute "find ./**/" . regex_file
endfunction

function! M_search_word(extension)
	if mode() == 'n'
		if executable('rg')
			cexpr system('rg --vimgrep ' . expand('<cword>') . ' ./**/' . a:extension)
		else
			execute "vimgrep /" . expand('<cword>') . "/gj ./**/" . a:extension
		endif
		execute "tab +copen"
	elseif mode() == "V"
		execute "'<,' > norm y<CR>gv"
		if executable('rg')
			cexpr system('rg --vimgrep ' . getreg("*") . ' ./**/' . a:extension)
		else
			execute "vimgrep /" . getreg("*") . "/gj ./**/" . a:extension
		endif
	endif
endfunction

function! M_search_fuzzy(extension)
	let l:word=input("Enter word to search: ")
	if mode() == 'n'
		if empty(l:word)
			let l:word = expand('<cword>')
		endif

		if executable('rg')
			cexpr system('rg --vimgrep --smart-case ' . l:word . ' ./**/' . a:extension)
		else
			execute "vimgrep /" . l:word . "/gjf ./**"
		endif

		execute "tab +copen"
	elseif mode() == "V"
		if empty(l:word)
			let l:word = getreg("*")
		endif

		execute "'<,' > norm y<CR>gv"

		if executable('rg')
			cexpr system('rg --vimgrep ' . l:word . ' ./**/' . a:extension)
		else
			execute "vimgrep /" . l:word . "/gjf ./**"
		endif
	endif
endfunction

function! M_terminal(mode)
	if a:mode == "split"
		execute "term"

	elseif a:mode =="vertical"
		execute "vert term"
	elseif a:mode == "selection"
		let l:shell = input("Select shell (bash, sh, zsh, powershell.exe): ")
		if exists(':FloatermNew')
			execute "FloatermNew --width=0.9 --height=0.9 " . l:shell
		else
			execute "tab term " . l:shell
		endif
	else
		if exists(':FloatermNew')
			execute "FloatermNew --width=0.9 --height=0.9"
		else
			execute "tab term"
		endif
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

function! M_session(mode)
	let path = $HOME . '/.vim/session'
	let session_name = substitute(expand(getcwd()), '/', '_', 'g') . ".vim"
	let session = path . '/' . session_name

	if a:mode == "save"
		if isdirectory(path) == '0'
			call M_create_directory(path)
		endif

		execute "mksession!" . ' ' . session
	else
		if isdirectory(path) == '1' && filereadable(session)
			execute "source" . ' ' . session
		else
			echohl WarningMsg | echo "Session not found!" | echohl none
		endif
	endif
endfunction

function! M_build()
	function! s:convert_string_to_set_makeprg(cmd)
		let l:keep_backslash = substitute(a:cmd, '\', '\\\\', 'g')
		let l:keep_quotes = substitute(l:keep_backslash, '"', '\\"', 'g')
		let l:mp = substitute(l:keep_quotes, '\s', '\\ ', 'g')
		execute "set makeprg=" . l:mp
		return l:mp
	endfunction
	let l:count = 0

	for list in g:build_cmd_list
		echo printf("%2d: %s", l:count, list['name'])
		let l:count += 1
	endfor

	echo printf("%2d: %s", len(g:build_cmd_list), "Cancel")

	let l:choice = input("Select build: ")

	if l:choice == len(g:build_cmd_list)
		return v:false
	endif

	let l:cmd = g:build_cmd_list[l:choice]['cmd']
	call s:convert_string_to_set_makeprg(l:cmd)

	if exists(':Make')
		execute "Make"
	else
		execute "make"
	endif
endfunction

function! M_build_setup(name, cmd)
	call add(g:build_cmd_list, { 'name': a:name, 'cmd': a:cmd })
endfunction

command! -nargs=1 BuildSetup call M_build_setup(<args>)
command! -nargs=0 -bang Build call M_build()
