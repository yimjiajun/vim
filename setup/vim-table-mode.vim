if isdirectory($HOME . '/.vim/plugged/vim-table-mode')
	function! s:Autocmd_vim_table_mode()
		augroup vim_table_mode
			autocmd!
			autocmd FileType markdown,org
				\ let g:table_mode_corner='|' |
				\ execute 'TableModeEnable' |
		augroup END
	endfunction

	function! s:Setup_key_vim_table_mode()
		augroup vim_table_mode
			autocmd!
			autocmd FileType markdown,org
						\ let g:which_key_map.g.T = { 'name':'+ Table' } |
						\ let g:which_key_map.g.T.t = 'toggle' |
						\ nnoremap <silent> <Leader>gTt :TableModeToggle <CR> |
						\ let g:which_key_map.g.T.e = 'eval line' |
						\ nnoremap <silent> <Leader>gTe :TableEvalFormulaLine <CR> |
						\ let g:which_key_map.g.T.a = 'add formula' |
						\ nnoremap <silent> <Leader>gTa :TableAddFormula <CR> |
						\ let g:which_key_map.g.T.r = 're-align' |
						\ nnoremap <silent> <Leader>gTr :TableModeRealign <CR> |
						\ let g:which_key_map.g.T.s = 'sort' |
						\ nnoremap <silent> <Leader>gTs :TableSort <CR> |
						\ let g:which_key_map.g.T.S = 'tableize' |
						\ nnoremap <silent> <Leader>gTs :Tableize <CR> |
		augroup END
	endfunction

	let g:table_mode_disable_mappings = 1
	call s:Autocmd_vim_table_mode()
	call s:Setup_key_vim_table_mode()
endif
