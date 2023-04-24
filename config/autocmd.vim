augroup Binary
	au!
	au BufReadPre  *.bin let &bin=1
	au BufReadPost *.bin if &bin | %!xxd
	au BufReadPost *.bin set ft=xxd | endif
	au BufWritePre *.bin if &bin | %!xxd -r
	au BufWritePre *.bin endif
	au BufWritePost *.bin if &bin | %!xxd
	au BufWritePost *.bin set nomod | endif
augroup END

augroup LargeFile
	au!
	let g:large_file = 500 * 1048" 500KB

	" Set options:
	"   eventignore+=FileType (no syntax highlighting etc
	"   assumes FileType always on)
	"   noswapfile (save copy of file)
	"   bufhidden=unload (save memory when other file is viewed)
	"   buftype=nowritefile (is read-only)
	"   undolevels=-1 (no undo possible)
	au BufReadPre *
		\ let f=expand("<afile>") |
		\ if getfsize(f) > g:large_file |
		\ set eventignore+=FileType |
		\ setlocal noswapfile bufhidden=unload buftype=nowrite undolevels=-1 |
		\ if getfsize(f) <= (1048*1048*1048) |
		\ if getfsize(f) < (1048*1048) |
		\ echo "large file :" (getfsize(f)/1048)"KB" |
		\ else |
		\ echo "large file :" (getfsize(f)/1048/1048)(getfsize(f)/1048%1000)"MB" |
		\ endif |
		\ else |
		\ echo "large file :" (getfsize(f)/1048/1048/1048)(getfsize(f)/1048/1048%1000)"GB" |
		\ endif |
		\ else |
		\ set eventignore-=FileType |
		\ endif
augroup END

augroup programming
	augroup c
		au!
		au FileType cpp,c
		\ setlocal cindent |
		\ setlocal softtabstop=4 |
		\ setlocal tabstop=4 |
		\ setlocal shiftwidth=4 |
		\ setlocal noexpandtab |
	augroup END

	augroup md
		au!
		au FileType markdown
		\ setlocal softtabstop=2 |
		\ setlocal tabstop=2 |
		\ setlocal shiftwidth=2 |
		\ setlocal expandtab |
		\ setlocal spell |
	augroup END

	augroup py
		au!
		au FileType python
		\ setlocal softtabstop=2 |
		\ setlocal tabstop=2 |
		\ setlocal shiftwidth=2 |
		\ setlocal expandtab |
	augroup END
augroup END

augroup format
	augroup MS_DOC_new_line_kill
		au!
		au BufWritePre *
		\ execute '%s/\r\+$//e'
	augroup END

	augroup kill_trailing_whitespace
		au!
		au BufWritePre *
		\ execute '%s/\s\+$//e'
	augroup END

	augroup display_whitespace_trailing
		au!
		au Syntax *
		\ execute 'match ExtraWhitespace /\s\+$\| \+\ze\t/'
	augroup END

	augroup cursorline
		au!
		au InsertLeave,WinEnter *
		\ set cursorline

		au InsertEnter,WinLeave *
		\ set nocursorline
	augroup END
augroup END

augroup session
	augroup save_session
		au!
		au VimLeavePre * call M_session("save")
	augroup END
augroup END
