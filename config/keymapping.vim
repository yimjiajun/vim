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

function! s:Setting_key_move()
	inoremap <silent> <C-b> <Left>
	inoremap <silent> <C-f> <Right>
endfunction

function! s:Setting_key_buffer()
	inoremap <silent> <C-s> <C-o>:w<CR>
	nnoremap <silent> <S-Tab> :bp<CR>
	nnoremap <silent> <Tab> :bn<CR>
	nnoremap <silent> <esc><esc> :bd<CR>

	let g:which_key_map.b = 'Buffers'
	nnoremap <silent> <Leader>b :call M_buffer("list")<CR>
	let g:which_key_map.m = 'Marks'
	nnoremap <silent> <Leader>m :call M_marks("default")<CR>
endfunction

function! s:Setting_key_view()
	nnoremap <silent> <BS> :set hlsearch!<CR>
	if isdirectory($HOME . '/.vim/plugged/tagbar')
		let g:which_key_map.T = 'Tagbar'
		nnoremap <silent> <Leader>T :TagbarToggle<CR>
	endif
endfunction

function! s:Setting_key_edit()
	inoremap lkj <ESC>
	tnoremap lkj <ESC>
	tnoremap \][ <C-c> exit<CR>
	inoremap () ()<ESC>i
	inoremap {} {}<ESC>i
	inoremap "" ""<ESC>i
	inoremap '' ''<ESC>i
	inoremap {<CR> {<CR>}<C-o>O
	inoremap (<CR> (<CR>)<C-o>O
	inoremap [<CR> [<CR>]<C-o>O
	inoremap "<CR> "<CR>"<C-o>O
	inoremap '<CR> '<CR>'<C-o>O

	if isdirectory($HOME . '/.vim/plugged/vim-easy-align')
		let g:which_key_map.t.a  = 'Alignment'
		nnoremap <silent> <Leader>ta <Plug>(LiveEasyAlign)
		xnoremap <silent> <Leader>ta <Plug>(LiveEasyAlign)
	endif
endfunction

function! s:Setting_key_yank()
	""nnoremap x "_x
	nnoremap X "_X
	vnoremap x "_x
	vnoremap X "_X
	vnoremap p "_dp
endfunction

function! s:Setting_key_leader()
	if v:version >= 900
		let g:mapleader=" "
		let g:maplocalleader=" "
	else
		let mapleader = " "
		let maplocalleader  = " "
	endif
endfunction

function! s:Setting_key_newtr()
	let g:which_key_map.e = 'Explorer'
	nnoremap <silent> <Leader>e :Lexplore<CR>
	let g:which_key_map.E = 'Explorer->file'
	nnoremap <silent> <Leader>E :Explore<CR>
endfunction

function! s:Setting_key_search()
	let g:which_key_map.f.f = 'files'
	nnoremap <silent> <Leader>ff :call M_search_file()<CR>
	let g:which_key_map.f.w = 'word'
	nnoremap <silent> <Leader>fw :call M_search_word(" ")<CR>
	let g:which_key_map.f.c = '.c'
	nnoremap <silent> <Leader>fc :call M_search_word("*.c")<CR>
	let g:which_key_map.f.C = '.c, .cpp, .h'
	nnoremap <silent> <Leader>fC :call M_search_word("*.{c,h,cpp}")<CR>
	let g:which_key_map.f.h = '.h'
	nnoremap <silent> <Leader>fh :call M_search_word("*.h")<CR>
	let g:which_key_map.f.d = '.dts, .dtsi'
	nnoremap <silent> <Leader>fd :call M_search_word("*.{dts,dtsi}")<CR>
	let g:which_key_map.f.A = 'fuzzy search'
	nnoremap <silent> <Leader>fA :call M_search_fuzzy(" ")<CR>
	let g:which_key_map.f.a = 'search'
	nnoremap <silent> <Leader>fa :call M_search_fuzzy(" ")<CR>
	let g:which_key_map.f.q = 'custom filetype search'
	nnoremap <silent> <Leader>fq :call M_search_fuzzy("*." . input("Enter FileType: "))<CR>
	let g:which_key_map.f.Q = 'custom file search'
	nnoremap <silent> <Leader>fQ :call M_search_fuzzy(input("Enter FileType: "))<CR>
	let g:which_key_map.f.K = 'Kconfig'
	nnoremap <silent> <Leader>fK :call M_search_word("Kconfig")<CR>
	let g:which_key_map.f.k = '.conf'
	nnoremap <silent> <Leader>fk :call M_search_word("*.conf")<CR>
	let g:which_key_map.f.m = 'CMakeLists'
	nnoremap <silent> <Leader>fm :call M_search_word("CMakeLists.txt") <CR>
	let g:which_key_map.f.v = 'vim'
	nnoremap <silent> <Leader>fv :call M_search_fuzzy(input("Enter FileType: ", "*."))<CR>
endfunction

function! s:Setting_key_git()

	let g:which_key_map.g.g = { 'name': '+ Git' }
	let g:which_key_map.g.g.l = 'log'
	nnoremap <silent> <Leader>ggl :call M_git_log("graph")<CR>
	let g:which_key_map.g.g.L = 'log (info..)'
	nnoremap <silent> <Leader>ggL :call M_git_log("default")<CR>
	let g:which_key_map.g.g.H = 'log (diff)'
	nnoremap <silent> <Leader>ggH :call M_git_log("diff")<CR>
	let g:which_key_map.g.g.C = 'commit count'
	nnoremap <silent> <Leader>ggC :call M_git_log("commit_count")<CR>
	let g:which_key_map.g.g.d = 'diff'
	nnoremap <silent> <Leader>ggd :call M_git_diff("default")<CR>
	let g:which_key_map.g.g.D = 'diff (prev)'
	nnoremap <silent> <Leader>ggD :call M_git_diff("previous")<CR>
	let g:which_key_map.g.g.h = 'diff (staging)'
	nnoremap <silent> <Leader>ggh :call M_git_diff("staging")<CR>
	let g:which_key_map.g.g.s = 'status'
	nnoremap <silent> <Leader>ggs :call M_git_status("default")<CR>
	let g:which_key_map.g.g.S = 'status (short)'
	nnoremap <silent> <Leader>ggS :call M_git_status("short")<CR>
	let g:which_key_map.g.g.w = 'whitespace check'
	nnoremap <silent> <Leader>ggw :call M_git_status("check_whitespace")<CR>
	let g:which_key_map.g.g.p = 'add (patch)'
	nnoremap <silent> <Leader>ggp :call M_git_add("patch")<CR>
	let g:which_key_map.g.g.a = 'add'
	nnoremap <silent> <Leader>gga :call M_git_add("default")<CR>
	let g:which_key_map.g.g.A = 'add (all)'
	nnoremap <silent> <Leader>ggA :call M_git_add("all")<CR>
	let g:which_key_map.g.g.c = 'commit'
	nnoremap <silent> <Leader>ggc :call M_git_commit("default")<CR>
endfunction

function! s:Setting_key_terminal()
	let g:which_key_map.t.s = 'Term (split)'
	nnoremap <silent> <Leader>ts :call M_terminal("split")<CR>
	let g:which_key_map.t.v = 'Term (vert)'
	nnoremap <silent> <Leader>tv :call M_terminal("vertical")<CR>
	let g:which_key_map.t.f = 'Term'
	nnoremap <silent> <Leader>tf :call M_terminal("default")<CR>
	let g:which_key_map.t.F = 'Term (selection)'
	nnoremap <silent> <Leader>tF :call M_terminal("selection")<CR>
endfunction

function! s:Setting_key_session()
	let g:which_key_map.s = 'Session load'
	nnoremap <silent> <Leader>s :call M_session("load")<CR>
endfunction

call s:Setting_key_leader()
call s:Setting_key_move()
call s:Setting_key_buffer()
call s:Setting_key_view()
call s:Setting_key_edit()
call s:Setting_key_yank()
call s:Setting_key_newtr()
call s:Setting_key_search()
call s:Setting_key_git()
call s:Setting_key_terminal()
call s:Setting_key_session()
