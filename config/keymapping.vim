let g:which_key_map = {}
let g:which_key_map_visual = {}
let g:which_key_map.g = { 'name': '+ Global Plug' }
let g:which_key_map.f = { 'name': '+ Finder' }
let g:which_key_map.t = { 'name': '+ Toggle' }
let g:which_key_map.l = { 'name': '+ Lsp' }
let g:which_key_map.l.a = { 'name': '+ Actions' }
let g:which_key_map.l.r = { 'name': '+ Rename/Refactor' }
let g:which_key_map.l.q = { 'name': '+ Quickfix' }
let g:which_key_map.l.l = { 'name': '+ List' }

function! Setting_key_move()
	silent inoremap <C-b> <Left>
	silent inoremap <C-f> <Right>
endfunction

function! Setting_key_buffer()
	silent inoremap <C-s> <C-o>:w<CR>
	silent nnoremap <S-Tab> :bp<CR>
	silent nnoremap <Tab> :bn<CR>
	silent nnoremap <esc><esc> :bd<CR>

	let g:which_key_map.b = 'Buffers'
	silent nnoremap <Leader>b :call M_buffer("list")<CR>
	let g:which_key_map.m = 'Marks'
	silent nnoremap <Leader>m :call M_marks("default")<CR>
endfunction

function! Setting_key_view()
	silent nnoremap <BS> :set hlsearch!<CR>
	if isdirectory($HOME . '/.vim/plugged/tagbar')
		let g:which_key_map.T = 'Tagbar'
		silent nnoremap <Leader>T :TagbarToggle<CR>
	endif
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
	let g:which_key_map.e = 'Explorer'
	silent nnoremap <Leader>e :call Open_Explorer('.')<CR>
	let g:which_key_map.E = 'Explorer->file'
	silent nnoremap <Leader>E :call Open_Explorer(' ')<CR>
endfunction

function! Setting_key_search()
	let g:which_key_map.f.f = 'files'
	silent nnoremap <Leader>ff :call M_search_file()<CR>
	let g:which_key_map.f.w = 'word'
	silent nnoremap <Leader>fw :call M_search_word(" ")<CR>
	let g:which_key_map.f.c = '.c'
	silent nnoremap <Leader>fc :call M_search_word("*.c")<CR>
	let g:which_key_map.f.C = '.c, .cpp, .h'
	silent nnoremap <Leader>fC :call M_search_word("*.{c,h,cpp}")<CR>
	let g:which_key_map.f.h = '.h'
	silent nnoremap <Leader>fh :call M_search_word("*.h")<CR>
	let g:which_key_map.f.d = '.dts, .dtsi'
	silent nnoremap <Leader>fd :call M_search_word("*.{dts,dtsi}")<CR>
	let g:which_key_map.f.A = 'fuzzy search'
	silent nnoremap <Leader>fA :call M_search_fuzzy(" ")<CR>
endfunction

function! Setting_key_git()

	let g:which_key_map.g.g = { 'name': '+ Git' }
	let g:which_key_map.g.g.l = 'log'
	silent nnoremap <Leader>ggl :call M_git_log("graph")<CR>
	let g:which_key_map.g.g.L = 'log (info..)'
	silent nnoremap <Leader>ggL :call M_git_log("default")<CR>
	let g:which_key_map.g.g.H = 'log (diff)'
	silent nnoremap <Leader>ggH :call M_git_log("diff")<CR>
	let g:which_key_map.g.g.C = 'commit count'
	silent nnoremap <Leader>ggC :call M_git_log("commit_count")<CR>
	let g:which_key_map.g.g.d = 'diff'
	silent nnoremap <Leader>ggd :call M_git_diff("default")<CR>
	let g:which_key_map.g.g.D = 'diff (prev)'
	silent nnoremap <Leader>ggD :call M_git_diff("previous")<CR>
	let g:which_key_map.g.g.h = 'diff (staging)'
	silent nnoremap <Leader>ggh :call M_git_diff("staging")<CR>
	let g:which_key_map.g.g.s = 'status'
	silent nnoremap <Leader>ggs :call M_git_status("default")<CR>
	let g:which_key_map.g.g.S = 'status (short)'
	silent nnoremap <Leader>ggS :call M_git_status("short")<CR>
	let g:which_key_map.g.g.w = 'whitespace check'
	silent nnoremap <Leader>ggw :call M_git_status("check_whitespace")<CR>
	let g:which_key_map.g.g.p = 'add (patch)'
	silent nnoremap <Leader>ggp :call M_git_add("patch")<CR>
	let g:which_key_map.g.g.a = 'add'
	silent nnoremap <Leader>gga :call M_git_add("default")<CR>
	let g:which_key_map.g.g.A = 'add (all)'
	silent nnoremap <Leader>ggA :call M_git_add("all")<CR>
	let g:which_key_map.g.g.c = 'commit'
	silent nnoremap <Leader>ggc :call M_git_commit("default")<CR>
endfunction

function! Setting_key_terminal()
	let g:which_key_map.t.s = 'Term (split)'
	silent nnoremap <Leader>ts :call M_terminal("split")<CR>
	let g:which_key_map.t.v = 'Term (vert)'
	silent nnoremap <Leader>tv :call M_terminal("vertical")<CR>
	let g:which_key_map.t.f = 'Term'
	silent nnoremap <Leader>tf :call M_terminal("default")<CR>
	let g:which_key_map.t.F = 'Term (selection)'
	silent nnoremap <Leader>tF :call M_terminal("selection")<CR>
endfunction

function! Setting_key_session()
	let g:which_key_map.s = 'Session load'
	silent nnoremap <Leader>s :call M_session("load")<CR>
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
call Setting_key_terminal()
call Setting_key_session()
