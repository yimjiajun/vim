function! Setting_view()
	set timeoutlen=200
	set updatetime=400
	set showmode
	set laststatus=2
	set cmdheight=1
	set relativenumber
	set wrap
	set linebreak
	set splitbelow
	set nosplitright
	set wildmenu
	set cursorline
	set nocursorcolumn
	execute 'syntax on'

	" if has('termguicolors')
		" set termguicolors
	" endif
endfunction

function! Setting_editor()
	set ignorecase
	set smartcase
	set showmatch
	set autoindent
	set smartindent
	set nobackup
	set nowritebackup
	set noswapfile

	if !isdirectory($HOME. '/.vim/undodir')
		echo "=========================="
		echo " Create undo directory ..."
		echo "=========================="
		silent execute '! mkdir -p "$HOME/.vim/undodir"'
		silent execute '! chmod -R 777 "$HOME/.vim/undodir"'
	endif

	set undodir=$HOME/.vim/undodir
	set undofile
endfunction

function! Setting_buffer()
	set hidden
	set lazyredraw
endfunction

function! Setting_plugin_manager()
	if !filereadable($HOME . '/.vim/autoload/plug.vim')
		echo "==========================="
		echo " Download Plugin Manager ..."
		echo "==========================="
		silent execute '! curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
		echo "==========================="
		echo " Plugin Manager Installed !"
		echo "==========================="
	endif

endfunction

set nocompatible
call Setting_view()
call Setting_editor()
call Setting_buffer()
call Setting_plugin_manager()
