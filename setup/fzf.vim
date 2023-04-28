if isdirectory($HOME . '/.vim/plugged/fzf.vim')
	function! RipgrepFzf(query, fullscreen, file_extension)
		let file_extension = a:file_extension
		let command_fmt = 'rg --vimgrep --column --line-number --no-heading --color=always --smart-case -- %s ' . ' --glob ./**/' . a:file_extension .  ' || true'
		let initial_command = printf(command_fmt, shellescape(a:query))
		let reload_command = printf(command_fmt, '{q}')
		let spec = {'options': ['--disabled', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
		let spec = fzf#vim#with_preview(spec, 'right', 'ctrl-/')
		call fzf#vim#grep(initial_command, 1, spec, a:fullscreen)
	endfunction

	function! s:Setting_key_fzf_search()
		let g:which_key_map.f.f = 'files'
		nnoremap <silent> <Leader>ff :Files <CR>
		let g:which_key_map.f.w = 'word'
		nnoremap <silent> <Leader>fw :call RipgrepFzf(expand('<cword>'), 0, '*')<CR>
		let g:which_key_map.f.c = '.c'
		nnoremap <silent> <Leader>fc :call RipgrepFzf(expand('<cword>'), 0, '*.c')<CR>
		let g:which_key_map.f.C = '.c, .cpp, .h'
		nnoremap <silent> <Leader>fC :call RipgrepFzf(expand('<cword>'), 0, '*.{c,cpp,h}')<CR>
		let g:which_key_map.f.h = '.h'
		nnoremap <silent> <Leader>fh :call RipgrepFzf(expand('<cword>'), 0, '*.h')<CR>
		let g:which_key_map.f.d = '.dts, .dtsi'
		nnoremap <silent> <Leader>fd :call RipgrepFzf(expand('<cword>'), 0, '*.{dts,dtsi}')<CR>
		let g:which_key_map.f.A = 'fuzzy search'
		nnoremap <silent> <Leader>fA :call RipgrepFzf('', 0, '* --hidden')<CR>
		let g:which_key_map.f.a = 'search'
		nnoremap <silent> <Leader>fa :RG<CR>
		let g:which_key_map.f.q = 'custom filetype search'
		nnoremap <silent> <Leader>fq :call RipgrepFzf(expand('<cword>'), 0, "*." . input("Enter FileType: "))<CR>
		let g:which_key_map.f.Q = 'custom file search'
		nnoremap <silent> <Leader>fQ :call RipgrepFzf(expand('<cword>'), 0, input("Enter FileType: "))<CR>
		let g:which_key_map.f.K = 'Kconfig'
		nnoremap <silent> <Leader>fK :call RipgrepFzf(expand('<cword>'), 0, "Kconfig")<CR>
		let g:which_key_map.f.k = '.conf'
		nnoremap <silent> <Leader>fk :call RipgrepFzf(expand('<cword>'), 0, "*.conf")<CR>
		let g:which_key_map.f.m = 'CMakeLists'
		nnoremap <silent> <Leader>fm :call RipgrepFzf(expand('<cword>'), 0, "CMakeLists.txt") <CR>
	endfunction

	command! -bang -nargs=? -complete=dir Files
	    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
	command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0, "*")

	call s:Setting_key_fzf_search()
endif
