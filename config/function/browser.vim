function! M_get_browser()
	let browser = ''
	if isdirectory('/run/WSL') || has('win32')
		if executable('MicrosoftEdge.exe')
			let browser = 'MicrosoftEdge.exe'
		elseif executable('firefox.exe')
			let browser = 'firefox.exe'
		elseif executable('chrome.exe')
			let browser = 'chrome.exe'
		endif
	else

		if executable('MicrosoftEdge')
			let browser = 'MicrosoftEdge'
		elseif executable('firefox')
			let browser = 'firefox'
		elseif executable('chrome')
			let browser = 'chrome'
		elseif has('macox') && executable('safari')
			let browser = 'safari'
		endif
	end

	return browser
endfunction

function! M_open_browser(src)
	let cmd = ''

	if has('unix')
		if isdirectory('/run/WSL')
			let cmd = 'wslview'
		elseif executable('xdg-open')
			let cmd = 'xdg-open'
		endif
	endif

	if empty(cmd)
		let cmd = M_get_browser()
	endif

	if empty(cmd)
		echohl WarningMsg | echo "Browser Not Found ..." | echohl none
	else
		execute "!" . cmd . ' ' . a:src
	endif

	return cmd
endfunction
