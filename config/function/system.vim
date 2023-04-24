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
