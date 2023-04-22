function! Setting_key_move()
	silent inoremap <C-b> <Left>
	silent inoremap <C-f> <Right>
endfunction

function! Setting_key_buffer()
	silent inoremap <C-s> <C-o>:w<CR>
	silent nnoremap <S-Tab> :bp<CR>
	silent nnoremap <Tab> :bn<CR>
	silent nnoremap <esc><esc> :bd<CR>
endfunction

function! Setting_key_view()
	silent nnoremap <BS> :set hlsearch!<CR>
endfunction

function! Setting_key_edit()
	silent inoremap lkj <ESC>
	silent tnoremap lkj <ESC>
	silent tnoremap \][ <C-c>exit<CR>
	silent inoremap () ()<ESC>i
	silent inoremap {} {}<ESC>i
	silent inoremap "" ""<ESC>i
	silent inoremap '' ''<ESC>i
	silent inoremap {<CR> {<CR>}<C-o>O
	silent inoremap (<CR> (<CR>)<C-o>O
	silent inoremap [<CR> [<CR>]<C-o>O
	silent inoremap "<CR> "<CR>"<C-o>O
	silent inoremap '<CR> '<CR>'<C-o>O
endfunction

function! Setting_key_yank()
	silent nnoremap x "_x
	silent nnoremap X "_X
	silent vnoremap x "_x
	silent vnoremap X "_X
	silent vnoremap p "_dp
endfunction

function! Setting_key_leader()
	if v:version >= 900
		let g:mapleader=" "
		let g:maplocalleader=" "
	else
		let mapleader = " "
		let maplocalleader  = " "
	endif
endfunction

function! Setting_key_newtr()
	function! Open_Explorer(path)
		if &filetype == "netrw"
			execute "close"
		elseif empty(&filetype)
			execute "Ex"
		else
			execute "50vs +Ex" . a:path
		endif
	endfunction
	silent nnoremap <Leader>e :call Open_Explorer('.')<CR>
	silent nnoremap <Leader>E :call Open_Explorer(' ')<CR>
endfunction

call Setting_key_leader()
call Setting_key_move()
call Setting_key_buffer()
call Setting_key_view()
call Setting_key_edit()
call Setting_key_yank()
call Setting_key_newtr()
