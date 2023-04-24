if filereadable($HOME . '/.vim/autoload/plug.vim')
	call plug#begin()
		Plug 'tpope/vim-fugitive'

		Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
		Plug 'junegunn/fzf.vim'

		Plug 'lifepillar/vim-gruvbox8'

		Plug 'liuchengxu/vim-which-key'
		" On-demand lazy load
		Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
	call plug#end()

	let g:plug_threads = 16
	let g:plug_window = "topleft"
	let g:plug_timeout = 60
	let g:plug_retries = 2
endif
