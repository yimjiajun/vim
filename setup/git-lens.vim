if isdirectory($HOME . '/.vim/plugged/git-lens.vim')
	function! s:Setting_key_git_lens()
		let g:which_key_map.g.g.b = 'blame'
		nnoremap <silent> <Leader>ggb :call ToggleGitLens()<CR>
	endfunction

	let g:GIT_LENS_CONFIG = {
		\ 'blame_prefix': ' >> ',
		\ 'blame_highlight': '',
		\ 'blame_wrap': 1,
		\ }

	call s:Setting_key_git_lens()
endif
