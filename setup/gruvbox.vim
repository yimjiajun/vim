if isdirectory($HOME . '/' . '.vim/plugged/gruvbox')
	set background=dark
	let g:gruvbox_contrast_dark = 'hard'
	let g:gruvbox_contrast_light = 'hard'
	let g:gruvbox_sign_column = 'bg0'
	colorscheme gruvbox
endif

function! H_gruvbox()
	let website = "https://github.com/morhetz/gruvbox/wiki/Configuration"

	echo printf("Gruvbox: Please visit %s\n", website)
	if input("visit? (Y/n) ") =~ '\c^[yY].*$\c\|^\c[yY]$'
		call M_open_browser(expand(website))
	endif
endfunction
