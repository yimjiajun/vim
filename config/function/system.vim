let g:system_install_cmd = ''

function! M_create_directory(name)
	if isdirectory(expand(a:name)) == '0'
		call mkdir(expand(a:name), 'p')

		if isdirectory(expand(a:name))
			echo "Directory created: " . a:name
		else
			echohl ErrorMsg | echo "Failed to create directory !" | echo none
		endif
	else
			echo "Directory exists: " . a:name
	endif
endfunction

function! M_get_os_like_id()
	if has('mac')
		let l:id =  system("echo $OSTYPE")
	elseif has('unix')
		let l:id = system("cat /etc/os-release | grep ID_LIKE | cut -d '=' -f 2")
	else
		let l:id = 'unknow'
	endif

	return trim(l:id)
endfunction

function! M_get_install_package_cmd()
	if empty(g:system_install_cmd)
		if has('mac')
			if executable('brew')
				let g:system_install_cmd = 'brew install '
			elseif executable('port')
				let g:system_install_cmd = 'sudo port intall'
			endif
		elseif has('unix')
			if M_get_os_like_id() == 'debian'
				let g:system_install_cmd = 'sudo apt install -y '
			endif
		endif

		if empty(g:system_install_cmd)
			echohl WarningMsg | echo "System intall command not found ! ..." | echohl none

			let g:system_install_cmd = input("Please enter system install command: ")

			echohl Question | echo "System Install Command Provided: " . g:system_install_cmd | echohl none

			if intput("Confirm ?(Y/n) ") !=~ '\c^[yY].*$\c\|^\c[yY]$'
				let g:system_install_cmd = ''
			endif
		endif
	endif

	return g:system_install_cmd
endfunction

function! M_get_remote_path(server)
	let l:remote_path = ''

	if tolower(a:server) == 'dropbox'
		if has('unix')
			let l:remote_path = expand($HOME . '/Dropbox')

			if isdirectory('/run/WSL')
				let l:win_remote_path = system('find /mnt/c/Users/*/ -maxdepth 1 -type d \( -iname "Dropbox" ! -path "*All Users*" \) -print -quit 2>/dev/null')
				let l:win_remote_path = substitute(l:win_remote_path, '\n', '', 'g')

				if empty(l:win_remote_path) == 0
					execute "silent !ln -sf " . l:win_remote_path . " " . l:remote_path
				endif
			endif
		endif
	endif

	if empty(l:remote_path) == 0
		if !isdirectory(l:remote_path)
			echohl ErrorMsg | echo "Remote path not found !" | echohl none
			return ''
		endif
	endif

	return l:remote_path
endfunction

function! M_create_ctags()
	echo  system("ctags -RV . && sort -u -o tags tags")

	if file_readable('tags')
		echohl MoreMsg | echo "Ctags created !" | echohl none
	else
		echohl ErrorMsg | echo "Failed to create ctags !" | echohl none
	endif
endfunction
