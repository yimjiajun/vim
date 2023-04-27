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
		silent nnoremap <Leader>gGt :GitGutterToggle<CR>
		let g:which_key_map.g.G.t  = 'Buffer'
		silent nnoremap <Leader>gGb :GitGutterBufferToggle<CR>
		let g:which_key_map.g.G.c  = 'Sign Column'
		silent nnoremap <Leader>gGc :GitGutterSignsToggle<CR>
		let g:which_key_map.g.G.l  = 'Line Highlights'
		silent nnoremap <Leader>gGl :GitGutterLineHighlightsToggle<CR>
		let g:which_key_map.g.G.L  = 'Line NR Highlights'
		silent nnoremap <Leader>gGL :GitGutterLineNrHighlightsToggle<CR>
		let g:which_key_map.g.G.n  = 'Next Hunk'
		silent nnoremap <Leader>gGn <Plug>(GitGutterNextHunk)
		let g:which_key_map.g.G.p  = 'previous Hunk'
		silent nnoremap <Leader>gGp <Plug>(GitGutterPrevHunk)
		let g:which_key_map.g.G.s  = 'Stage Hunk'
		silent nnoremap <Leader>gGs <Plug>(GitGutterStageHunk)
		let g:which_key_map.g.G.S  = 'Undo Stage Hunk'
		silent nnoremap <Leader>gGS <Plug>(GitGutterUndoHunk)
	endfunction

	call s:Key_setup_gitgutter()
endif
