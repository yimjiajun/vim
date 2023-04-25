if isdirectory($HOME . '/.vim/plugged/coc.nvim')

function! H_coc()
	echo "1. Compltes with source"
	echo "2. Languages Server"
	echo "3. Extensions"
	let l:sel = input("Enter number to get help (1-3): ")

	if l:sel == 1
		let l:website = "https://github.com/neoclide/coc.nvim/wiki/Completion-with-sources"
		call M_open_browser(l:website)
	elseif l:sel == 2
		let l:website = "https://github.com/neoclide/coc.nvim/wiki/Language-servers"
		call M_open_browser(l:website)
	elseif l:sel == 3
		let l:website = "https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions"
		call M_open_browser(l:website)
	else
		execute "h coc-nvim"
	endif
endfunction

" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
"
let g:which_key_map.l.r.n = 'symbol rename'
nmap <leader>lrn <Plug>(coc-rename)

" Formatting selected code
let g:which_key_map.l.f = 'format selected code'
xmap <leader>lf  <Plug>(coc-format-selected)
nmap <leader>lf  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
let g:which_key_map.l.a.a = 'code actions (block)'
xmap <leader>laa  <Plug>(coc-codeaction-selected)
nmap <leader>laa  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
let g:which_key_map.l.a.c = 'code actions (cursor)'
nmap <leader>lac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
let g:which_key_map.l.a.s = 'code actions (buffer)'
nmap <leader>las  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
let g:which_key_map.l.q.f = 'fix diagnostics (line)'
nmap <leader>lqf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
let g:which_key_map.l.r.e = 'refactor code actions'
nmap <silent> <leader>lre <Plug>(coc-codeaction-refactor)
let g:which_key_map.l.r.s = 'refactor code actions (selected)'
xmap <silent> <leader>lrs <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>lrs <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
let g:which_key_map.l.c = 'Code Lens action'
nmap <leader>lc  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=\ %{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
let g:which_key_map.l.l.a = 'diagnostics'
nnoremap <silent><nowait> <space>lla  :<C-u>CocList diagnostics<cr>
" Manage extensions
let g:which_key_map.l.l.e = 'extensions'
nnoremap <silent><nowait> <space>lle  :<C-u>CocList extensions<cr>
" Show commands
let g:which_key_map.l.l.c = 'commands'
nnoremap <silent><nowait> <space>llc  :<C-u>CocList commands<cr>
" Find symbol of current document
let g:which_key_map.l.l.o = 'outline'
nnoremap <silent><nowait> <space>llo  :<C-u>CocList outline<cr>
" Search workspace symbols
let g:which_key_map.l.l.s = 'symbols'
nnoremap <silent><nowait> <space>lls  :<C-u>CocList -I symbols<cr>
" Do default action for next item
let g:which_key_map.l.l.j = 'next default action item'
nnoremap <silent><nowait> <space>llj  :<C-u>CocNext<CR>
" Do default action for previous item
let g:which_key_map.l.l.k = 'previous default action item'
nnoremap <silent><nowait> <space>llk  :<C-u>CocPrev<CR>
" Resume latest coc list
let g:which_key_map.l.l.p = 'resume list'
nnoremap <silent><nowait> <space>llp  :<C-u>CocListResume<CR>

endif "if isdirectory($HOME . '/.vim/plugged/coc.nvim')
