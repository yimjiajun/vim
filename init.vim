function GetAbsolutePath(path1, path2)
	let full_path = a:path1 . '/' . a:path2
	let absolute_path = fnamemodify(full_path, ':p')
	return absolute_path
endfunction

for _dir in ['config', 'setup']
	let vimscripts = split(glob(GetAbsolutePath(_dir, '*.vim')))
	for _script in vimscripts
		execute 'source ' . _script
	endfor
endfor
