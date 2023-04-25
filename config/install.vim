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

function! Install_go()
	if executable('go')
		echo "Skip install GO ..."
		return
	endif

	if has('mac')
		let l:download_src = "https://go.dev/dl/go1.20.3.darwin-arm64.pkg"
		echo system("open " .. expand(l:download_src))
	elseif has('unix')
		let l:download_src = "https://go.dev/dl/go1.20.3.linux-amd64.tar.gz"
		echo system("curl -o /tmp/go_install.tar.gz -O " ..  expand(l:download_src))
		echo system("rm -rf /usr/local/go && tar -C /usr/local -xzf /tmp/go_install.tar.gz")
		echo system("export PATH=$PATH:/usr/local/go/bin")
	elseif has('win32')
		let l:download_src = "https://go.dev/dl/go1.20.3.darwin-arm64.pkg://go.dev/dl/go1.20.3.windows-amd64.msi"
		echo system("start " .. expand(l:download_src))
	else
		echohl WarningMsg | echo "System not support ..." | echohl none
		return
	endif

	echo system("go version")
endfunction

function! Install_coc_language()
	function! Install_coc_cmkae()
		echo system("pip3 install cmake-language-server")
	endfunction

	if !isdirectory($HOME . '/.vim/plugged/coc.nvim')
		return
	endif

	let l:lang = ['coc-clangd', 'coc-markdownlint', 'coc-json', 'coc-cmake']
	let l:install = 'CocInstall'
	let l:install_cmd = l:install

	call Install_coc_cmkae()

	for lang in l:lang
		let l:install_cmd .= ' ' . lang
	endfor

	execute l:install_cmd

	echo system("ln -sF $(dirname $VIMINIT | cut -d ' ' -f 2)/setup/coc-settings.json $HOME/.vim/")
endfunction

function! Install_all()
	echohl MoreMsg | call Display_tittle("Install all packages") | echohl none
	call Install_curl()
	call Install_nodejs()
	call Install_ripgrep()
	call Install_fzf()
	call Install_coc_language()
endfunction
