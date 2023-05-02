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

		Plug 'preservim/tagbar'

		Plug 'tpope/vim-dispatch'

		Plug 'github/copilot.vim' " run ':Copilot! setup' to sign-up

		Plug 'junegunn/vim-easy-align'

		Plug 'airblade/vim-gitgutter'

		Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

		Plug 'machakann/vim-highlightedyank'

		Plug 'tpope/vim-commentary'

		Plug 'dhruvasagar/vim-dotoo'

		Plug 'Eliot00/git-lens.vim'
	call plug#end()

	let g:plug_threads = 16
	let g:plug_window = "topleft"
	let g:plug_timeout = 60
	let g:plug_retries = 2
endif
