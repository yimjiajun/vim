if isdirectory($HOME . '/.vim/plugged/markdown-preview.nvim')
	function! s:markdown_preview_setup_browser()
		let g:mkdp_browser = M_get_browser()
	endfunction

	call s:markdown_preview_setup_browser()
endif
