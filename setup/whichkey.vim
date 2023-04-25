let g:mapleader = "\<Space>"
let g:maplocalleader = "\<Space>"
let g:which_key_vertical = 0
let g:which_key_position = 'botright'
let g:which_key_hspace = 5
let g:which_key_centered = 1
let g:which_key_sort_horizontal = 1
let g:which_key_use_floating_win = 0
let g:which_key_floating_relative_win = 0
let g:which_key_sep = ':'
let g:which_key_align_by_seperator = 0
let g:which_key_disable_default_offset = 1

highlight WhichKeyFloating guibg=bg guifg=fg

nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey '<Space>'<CR>
xnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
xnoremap <silent> <localleader> :<c-u>WhichKey '<Space>'<CR>

augroup whichkey
	autocmd!
	autocmd User vim-which-key call which_key#register('<Space>', 'g:which_key_map', 'n') |
				\ call which_key#register('<Space>', 'g:which_key_map_visual', 'v')

	autocmd  FileType which_key set laststatus=0 noshowmode noruler
	  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END
