function! Ssh_remote_access(username, ip,  password, port)
	if empty(a:username) || empty(a:ip) || empty(a:password)
		echo "Please input username, ip, password, port"
		return
	endif

	call Display_tittle("ssh remote access")

	if executable('sshpass')
		execute "tab term " . "sshpass -p " . a:password . " ssh " . a:username . "@" . a:ip . " -p " . a:port
	else
		echo input("password: " . a:password . "\n" . "Please enter to continue...")
		execute "tab term " . "ssh " . a:username . "@" . a:ip . " -p " . a:port
	endif
endfunction

function! Ssh_remote_access_custom()
	let l:username = input("username: ")
	let l:ip = input("ip: ")
	let l:password = input("password: ")
	let l:port = input("port: ")
	call Ssh_remote_access(l:username, l:ip, l:password, l:port)
endfunction

function! Ssh_remote_access_selection(sel)
	if a:sel == 'my_raspberrypi'
		let l:username = 'yimjiajun'
		let l:ip = 'raspberrypi.local'
		let l:password = 'jun'
		let l:port = '22'
	else
		echo "Please input username, ip, password, port"
		return
	endif
	call Ssh_remote_access(l:username, l:ip, l:password, l:port)
endfunction

function! Ssh_copy_file(username, ip, password, port, src, dest, send_to_remote)
	if empty(a:username) || empty(a:ip) || empty(a:password) || empty(a:src) || empty(a:dest)
		echo "Please input username, ip, password, src, dest"
		return
	endif

	let l:remote = "scp://" . a:username . "@" . a:ip . ":" . a:port . "/"

	if !empty(a:send_to_remote)
		execute "scp " . a:src . " " . l:remote . a:dest
	else
		execute "scp " . l:remote . a:src . " " . a:dest
	endif
endfunction

function! Ssh_copy_file_custom()
	let l:username = input("username: ")
	let l:ip = input("ip: ")
	let l:password = input("password: ")
	let l:port = input("port: ")
	let l:src = input("src: ")
	let l:dest = input("dest: ")
	let l:send_to_remote = input("send_to_remote (Y?): ")
	call Ssh_copy_file(l:username, l:ip, l:password, l:port, l:src, l:dest, l:send_to_remote)
endfunction
