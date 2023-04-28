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
		silent nnoremap <Leader>ff :Files <CR>
		let g:which_key_map.f.w = 'word'
		silent nnoremap <Leader>fw :call RipgrepFzf(expand('<cword>'), 0, '*')<CR>
		let g:which_key_map.f.c = '.c'
		silent nnoremap <Leader>fc :call RipgrepFzf(expand('<cword>'), 0, '*.c')<CR>
		let g:which_key_map.f.C = '.c, .cpp, .h'
		silent nnoremap <Leader>fC :call RipgrepFzf(expand('<cword>'), 0, '*.{c,cpp,h}')<CR>
		let g:which_key_map.f.h = '.h'
		silent nnoremap <Leader>fh :call RipgrepFzf(expand('<cword>'), 0, '*.h')<CR>
		let g:which_key_map.f.d = '.dts, .dtsi'
		silent nnoremap <Leader>fd :call RipgrepFzf(expand('<cword>'), 0, '*.{dts,dtsi}')<CR>
		let g:which_key_map.f.A = 'fuzzy search'
		silent nnoremap <Leader>fA :call RipgrepFzf('', 0, '* --hidden')<CR>
		let g:which_key_map.f.a = 'search'
		silent nnoremap <Leader>fa :RG<CR>
		let g:which_key_map.f.q = 'custom filetype search'
		silent nnoremap <Leader>fq :call RipgrepFzf(expand('<cword>'), 0, "*." . input("Enter FileType: "))<CR>
		let g:which_key_map.f.Q = 'custom file search'
		silent nnoremap <Leader>fQ :call RipgrepFzf(expand('<cword>'), 0, input("Enter FileType: "))<CR>
		let g:which_key_map.f.K = 'Kconfig'
		silent nnoremap <Leader>fK :call RipgrepFzf(expand('<cword>'), 0, "Kconfig")<CR>
		let g:which_key_map.f.k = '.conf'
		silent nnoremap <Leader>fk :call RipgrepFzf(expand('<cword>'), 0, "*.conf")<CR>
		let g:which_key_map.f.m = 'CMakeLists'
		silent nnoremap <Leader>fm :call RipgrepFzf(expand('<cword>'), 0, "CMakeLists.txt") <CR>
	endfunction

	command! -bang -nargs=? -complete=dir Files
	    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
	command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0, "*")

	call s:Setting_key_fzf_search()
endif
