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
		let g:maplear = " "
		let g:maplocalleader = " "
	else
		let mapleader = " "
		let maplocalleader  = " "
	endif
endfunction

call Setting_key_leader()
call Setting_key_move()
call Setting_key_buffer()
call Setting_key_view()
call Setting_key_edit()
call Setting_key_yank()
