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
	silent tnoremap \][ <C-c> exit<CR>
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

function! Setting_key_search()
	silent nnoremap <Leader>ff :call M_search_file()<CR>
	silent nnoremap <Leader>fw :call M_search_word(" ")<CR>
	silent nnoremap <Leader>fc :call M_search_word("*.c")<CR>
	silent nnoremap <Leader>fC :call M_search_word("*.{c,h,cpp}")<CR>
	silent nnoremap <Leader>fh :call M_search_word("*.h")<CR>
	silent nnoremap <Leader>fd :call M_search_word("*.{dts,dtsi}")<CR>
	silent nnoremap <Leader>fA :call M_search_fuzzy(" ")<CR>
endfunction

function! Setting_key_git()
	silent nnoremap <Leader>ggl :call M_git_log("graph")<CR>
	silent nnoremap <Leader>ggL :call M_git_log("default")<CR>
	silent nnoremap <Leader>ggH :call M_git_log("diff")<CR>
	silent nnoremap <Leader>ggC :call M_git_log("commit_count")<CR>
	silent nnoremap <Leader>ggd :call M_git_diff("default")<CR>
	silent nnoremap <Leader>ggD :call M_git_diff("previous")<CR>
	silent nnoremap <Leader>ggh :call M_git_diff("staging")<CR>
	silent nnoremap <Leader>ggs :call M_git_status("default")<CR>
	silent nnoremap <Leader>ggS :call M_git_status("short")<CR>
	silent nnoremap <Leader>ggw :call M_git_status("check_whitespace")<CR>
	silent nnoremap <Leader>ggp :call M_git_add("patch")<CR>
	silent nnoremap <Leader>gga :call M_git_add("default")<CR>
	silent nnoremap <Leader>ggA :call M_git_add("all")<CR>
	silent nnoremap <Leader>ggc :call M_git_commit("default")<CR>
endfunction

call Setting_key_leader()
call Setting_key_move()
call Setting_key_buffer()
call Setting_key_view()
call Setting_key_edit()
call Setting_key_yank()
call Setting_key_newtr()
call Setting_key_search()
call Setting_key_git()
