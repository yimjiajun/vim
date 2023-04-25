function! Display_tittle(string)
	let l:delimiter = '='
	let l:display = ''

	for i in range(1,50)
		let l:display .= l:delimiter
	endfor

	echo "+" . l:display . "+"
	echo "\t" . expand(a:string)
	echo "+" . l:display . "+"
endfunction

function! Install_curl()
	let l:pkg = 'curl'
	let l:install = M_get_install_package_cmd()
	let l:install_cmd = l:install . ' ' . l:pkg

	call Display_tittle(l:pkg)
	if executable(l:pkg) == 0 && !empty(l:install)
		echohl MoreMsg | echo "Install Curl to download requirement package ..." | echohl none
		echo system(l:install_cmd)
	endif
endfunction

function! Install_nodejs()
	if has('mac')
		let l:pkg = 'node'
	else
		let l:pkg = 'nodejs'
	endif

	call Display_tittle(l:pkg)
	if executable(l:pkg) == 0 && isdirectory($HOME . '/.vim/plugged/coc.nvim')
		echohl MoreMsg | echo "Install Nodejs for coc LSP ..." | echohl none
		echo system("curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash")
		echo system("nvm install 17.3.0")
	endif
endfunction

function! Install_ripgrep()
	let l:pkg = 'ripgrep'
	let l:install = M_get_install_package_cmd()
	let l:install_cmd = l:install . ' ' . l:pkg

	call Display_tittle(l:pkg)
	if executable('rg') == 0 && g:loaded_fzf == 1
		echohl MoreMsg | echo "Install RipGrep for fzf vim ..." | echohl none
		echo system(l:install_cmd)
	endif
endfunction

function! Install_fzf()
	let l:pkg = 'fzf'
	let l:install = M_get_install_package_cmd()
	let l:install_cmd = l:install . ' ' . l:pkg

	call Display_tittle(l:pkg)
	if executable(l:pkg) == 0 && g:loaded_fzf == 1
		echohl MoreMsg | echo "Install FzF for fzf vim ..." | echohl none
		echo system(l:install_cmd)
	endif
endfunction

