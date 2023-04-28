if isdirectory($HOME . "/.vim/plugged/vim-gitgutter")
	function! GitStatus()
		let [a,m,r] = GitGutterGetHunkSummary()
		return printf('+%d ~%d -%d', a, m, r)
	endfunction

	let g:gitgutter_map_keys = 0
	set statusline+=\ \ %{GitStatus()}
	set foldtext=gitgutter#fold#foldtext()

	function! s:Key_setup_gitgutter()
		let g:which_key_map.g.G = { 'name': '+ Git Gutter' }
		let g:which_key_map.g.G.t  = 'Toggle'
		nnoremap <silent> <Leader>gGt :GitGutterToggle<CR>
		let g:which_key_map.g.G.t  = 'Buffer'
		nnoremap <silent> <Leader>gGb :GitGutterBufferToggle<CR>
		let g:which_key_map.g.G.c  = 'Sign Column'
		nnoremap <silent> <Leader>gGc :GitGutterSignsToggle<CR>
		let g:which_key_map.g.G.l  = 'Line Highlights'
		nnoremap <silent> <Leader>gGl :GitGutterLineHighlightsToggle<CR>
		let g:which_key_map.g.G.L  = 'Line NR Highlights'
		nnoremap <silent> <Leader>gGL :GitGutterLineNrHighlightsToggle<CR>
		let g:which_key_map.g.G.n  = 'Next Hunk'
		nnoremap <silent> <Leader>gGn <Plug>(GitGutterNextHunk)
		let g:which_key_map.g.G.p  = 'previous Hunk'
		nnoremap <silent> <Leader>gGp <Plug>(GitGutterPrevHunk)
		let g:which_key_map.g.G.s  = 'Stage Hunk'
		nnoremap <silent> <Leader>gGs <Plug>(GitGutterStageHunk)
		let g:which_key_map.g.G.S  = 'Undo Stage Hunk'
		nnoremap <silent> <Leader>gGS <Plug>(GitGutterUndoHunk)
	endfunction

	call s:Key_setup_gitgutter()
endif
