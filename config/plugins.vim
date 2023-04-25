if filereadable($HOME . '/.vim/autoload/plug.vim')
	call plug#begin()
		Plug 'tpope/vim-fugitive'

		Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
		Plug 'junegunn/fzf.vim'

		Plug 'morhetz/gruvbox'

		Plug 'liuchengxu/vim-which-key'
		" On-demand lazy load
		Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

		Plug 'bfrg/vim-cpp-modern'

		Plug 'neoclide/coc.nvim', {'branch': 'release'}
		Plug 'voldikss/vim-floaterm'
		" Track the engine.
		Plug 'SirVer/ultisnips'
		" Snippets are separated from the engine. Add this if you want them:
		Plug 'honza/vim-snippets'

		Plug 'mhinz/vim-startify'

		Plug 'markonm/traces.vim'
	call plug#end()

	let g:plug_threads = 16
	let g:plug_window = "topleft"
	let g:plug_timeout = 60
	let g:plug_retries = 2
endif
