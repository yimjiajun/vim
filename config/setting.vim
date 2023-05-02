function! s:Setting_view()
	set background=dark
	set timeoutlen=300
	set updatetime=400
	set showmode
	set laststatus=2
	call M_statusline("default")
	set cmdheight=1
	set relativenumber
	set number
	set wrap
	set linebreak
	set splitbelow
	set nosplitright
	set wildmenu
	set cursorline
	set nocursorcolumn
	execute 'syntax on'
	set listchars=tab:▸\ ,trail:·,extends:…,precedes:…,nbsp:␣
	set list
	if has('termguicolors')
		set termguicolors
	endif
endfunction

function! s:Setting_editor()
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

function! s:Setting_buffer()
	set hidden
	set lazyredraw
endfunction

function! s:Setting_plugin_manager()
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

function! s:Setting_netrw()
	let g:netrw_liststyle = 3
	let g:netrw_banner = 0
	let g:netrw_browser_split = 4
	let g:netrw_altv = 1
	let g:netrw_winsize = 25
endfunction

set nocompatible
call s:Setting_view()
call s:Setting_editor()
call s:Setting_buffer()
call s:Setting_plugin_manager()
call s:Setting_netrw()
