if !has('nvim')
	function Get_absolute_path(base, path)
		let full_path = a:base . '/' . a:path
		let absolute_path = fnamemodify(full_path, ':p')
		return absolute_path
	endfunction

	function Append_path(base, path)
		let full_path = a:base . '/' . a:path
		let absolute_path = fnamemodify(full_path, ':p:h')
		return absolute_path
	endfunction

	let script_path = $HOME . "/.config/vim"

	for _dir in ['config', 'setup', 'features', 'usr']
		let path = Append_path(script_path, _dir)

		if path == script_path
			continue
		endif

		let vimscripts = split(glob(Get_absolute_path(path, '/**/*.vim')))
		for _script in vimscripts
			execute 'source ' . _script
		endfor
	endfor
else
	execute "source " . $HOME . "/.config/nvim/*.lua"
endif
