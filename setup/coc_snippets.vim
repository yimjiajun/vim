let g:install_coc_snippets_lang = ''

if isdirectory($HOME . '/.vim/plugged/coc.nvim') && isdirectory($HOME . '/.vim/plugged/vim-snippets') && isdirectory($HOME . '/.vim/plugged/ultisnips')
	let g:install_coc_snippets_lang = 'coc-snippets'
	" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
	" - https://github.com/Valloric/YouCompleteMe
	" - https://github.com/nvim-lua/completion-nvim
	let g:UltiSnipsExpandTrigger="<tab>"
	let g:UltiSnipsJumpForwardTrigger="<c-b>"
	let g:UltiSnipsJumpBackwardTrigger="<c-z>"

	" If you want :UltiSnipsEdit to split your window.
	let g:UltiSnipsEditSplit="vertical"
endif "if isdirectory($HOME . '/.vim/plugged/coc.nvim')
