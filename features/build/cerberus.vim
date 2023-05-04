function s:check_build_support()
	let path = getcwd()
	let filename = fnamemodify(path, ':p')

	if match(filename, '\cCerberus') >= 0
		return v:true
	endif

	return v:false
endfunction

function s:build_setup_unit_test()

	if executable('cmake')
		if isdirectory('./projects/linux/testing')
		let l:build_name = 'Cerberus Linux Unit Tests'
			let l:build_cmd = 'test -d build && cd ./build'
			let l:build_cmd .= ' && ' . 'cmake -G Ninja ../projects/linux/testing/'
			let l:build_cmd .= ' && ' . ' ninja '
			let l:build_cmd .= ' && ' . ' ./cerberus-linux-unit-tests'
		endif
	endif

	if isdirectory('./build') == 0
		call mkdir('./build')
	endif

	call M_build_setup(l:build_name, l:build_cmd)

	return v:true
endfunction

if s:check_build_support() == v:true
	s:build_setup_unit_test()
endif
