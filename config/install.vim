function! Display_tittle(string)
	let l:delimiter = '='
	let l:display = ''

	for i in range(1,50)
		let l:display .= l:delimiter
	endfor

	echohl MoreMsg
	echo "+" . l:display . "+"
	echo "\t" . expand(a:string)
	echo "+" . l:display . "+"
	echohl none
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
	let l:pkg = 'node'

	call Display_tittle(l:pkg)
	if isdirectory($HOME . '/.vim/plugged/coc.nvim')
		if executable(l:pkg) == 0
			echohl MoreMsg | echo "Install Nodejs for coc LSP ..." | echohl none
			echo system("curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash")
		endif

		if executable(l:pkg)
			let l:version = system(l:pkg . ' --version')
			let l:m_ver = matchstr(l:version, '\d\+')
			if l:m_ver < 14
				echohl MoreMsg | echo "Update Nodejs for coc LSP ..." |  echohl none

				if executable('nvm')
					echo system("nvm install 17.3.0")
				else
					echohl WarningMsg
					echo "Enter the command below to manual update nodejs:"
					echo "> $ nvm install 17.3.0"
					echohl none
				endif
			endif
		endif

	endif
endfunction

function! Install_ctags()
	call Display_tittle('ctags')

	if executable('ctags')
		return
	endif

	let l:url = 'https://github.com/universal-ctags/ctags.git'
	let l:path = expand('/tmp/ctags')

	for i in range(1, 99)
		let l:path_postfix = l:path
		let l:path_postfix .= '_' . i

		if !isdirectory(l:path_postfix)
			break
		endif
	endfor

	let l:cmd = 'git clone --depth=1 ' . l:url . ' ' . l:path_postfix
	echo system(l:cmd)

	if has('mac')
		let l:cmd = 'brew tap universal-ctags/universal-ctags' . ' && ' . 'brew install --HEAD universal-ctags/universal-ctags/universal-ctags'
		echo system(l:cmd)
	elseif has('unix')
		if isdirectory(l:path_postfix)
			let l:cmd = 'cd ' . l:path_postfix . ' && ./autogen.sh && ./configure && make && sudo make install'
			echo system(l:cmd)
		endif
	else
		echoerr "System not support ..."
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
	function! Install_coc_cmake()
		if executable('pip')
			echo system("pip install cmake-language-server")
		else
			echo system("pip3 install cmake-language-server")
		endif
	endfunction

	if !isdirectory($HOME . '/.vim/plugged/coc.nvim')
		return
	endif

	call Display_tittle("Coc LSP")

	let l:lang = "coc-clangd coc-markdownlint coc-json coc-cmake"
	let l:lang .= ' ' . g:install_coc_snippets_lang
	let l:install = 'CocInstall'
	let l:install_cmd = l:install . ' ' . l:lang
	silent execute l:install_cmd

	call Install_coc_cmake()
	echo system("ln -sF $(dirname $VIMINIT | cut -d ' ' -f 2)/setup/coc-settings.json $HOME/.vim/")
endfunction

function! Install_coc_snippets()

	call Display_tittle("coc-snippets")

	if !has('pythonx')
		if executable('pip')
			let l:pip_cmd = 'pip '
		else
			let l:pip_cmd = 'pip3 '
		endif

		echo system(l:pip_cmd . "install pynvim")

		execute "pyx print('python support in vim')"
	endif
endfunction

function! Install_all()
	echo "Install all packages ..."
	call Install_curl()
	call Install_nodejs()
	call Install_ctags()
	call Install_ripgrep()
	call Install_fzf()
	call Install_coc_snippets()
	call Install_coc_language()
endfunction

command! -nargs=0 -bang Install call Install_all()
