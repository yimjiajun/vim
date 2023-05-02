if isdirectory($HOME . '/.vim/plugged/vim-surround')
	function! s:Setting_key_surround()
		function! Surround_change_pairs()
			let l:chg = input('Enter change pair: ')
			let l:rep = input('Enter replace pair: ')
			execute 'norm cs' . l:chg . l:rep . '<CR>'
		endfunction

		function! Surround_remove_pairs()
			let l:rm = input('Enter remove pair: ')
			execute 'norm ds' . l:rm . '<CR>'
		endfunction

		function! Surround_full_pairs()
			let l:pair = input('Enter pair: ')
			execute 'norm cst' . l:pair . '<CR>'
		endfunction

		function! Surround_word_pairs()
			let l:pair = input('Enter pair: ')
			execute 'norm ysiw' . l:pair . '<CR>'
		endfunction

		function! Surround_line_pairs()
			let l:pair = input('Enter pair: ')
			execute 'norm yss' . l:pair . '<CR>'
		endfunction

		let g:which_key_map.g.s = { 'name': '+ Surround' }
		let g:which_key_map.g.s.p = 'change pairs'
		nnoremap <silent> <Leader>gsp :call Surround_change_pairs()<CR>
		let g:which_key_map.g.s.r = 'remove pairs'
		nnoremap <silent> <Leader>gsr :call Surround_remove_pairs()<CR>
		let g:which_key_map.g.s.f = 'full pairs'
		nnoremap <silent> <Leader>gsf :call Surround_remove_pairs()<CR>
		let g:which_key_map.g.s.w = 'word pairs'
		nnoremap <silent> <Leader>gsw :call Surround_word_pairs()<CR>
		let g:which_key_map.g.s.l = 'line pairs'
		nnoremap <silent> <Leader>gsl :call Surround_line_pairs()<CR>
	endfunction

	call s:Setting_key_surround()
endif
