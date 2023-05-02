if isdirectory($HOME . '/.vim/plugged/tabular')
	function! s:Setup_key_tabular()
		function! Tabular_align()
			let l:delimiter = input('Enter delimiter: ')
			execute 'Tabularize /' . l:delimiter
		endfunction

		let g:which_key_map.g.t = { 'name': '+ Tabular' }
		nnoremap <silent> <Leader>gt :call Tabular_align() <CR>
		vnoremap <silent> <Leader>gt :call Tabular_align() <CR>
	endfunction

	call s:Setup_key_tabular()
endif
