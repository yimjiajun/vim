if isdirectory($HOME . '/.vim/plugged/vim-dotoo')
	function! s:Key_setup_vim_dotoo()
		if exists("g:dotoo_disable_mappings") && g:dotoo_disable_mappings == 1
			unmap gA
			unmap gC
		endif
		let g:which_key_map.d= { 'name': '+ Dotoo' }
		let g:which_key_map.d.a = 'agenda'
		nmap <silent> <Leader>da <Plug>(dotoo-agenda)
		let g:which_key_map.d.c = 'capture'
		nmap <silent> <Leader>dc <Plug>(dotoo-capture)
	endfunction

	function! s:Template_dotoo(path)
                let g:dotoo#capture#templates = {
                      \ 't': {
                      \   'description': 'Todo',
                      \   'lines': [
                      \     '* TODO %?',
                      \     'DEADLINE: <%(strftime(g:dotoo#time#datetime_format))>'
                      \   ],
                      \  'target': 'refile'
                      \ },
                      \ 'n': {
                      \   'description': 'Note',
                      \   'lines': ['* %? :NOTE:'],
                      \ },
                      \ 'm': {
                      \   'description': 'Meeting',
                      \   'lines': ['* %? :MEETING:',
                      \     'SCHEDULED: <%(strftime(g:dotoo#time#date_day_format))> ',
		      \    ],
                      \  'target': 'meeting'
                      \ },
                      \ 'e': {
                      \   'description': 'Event',
                      \   'lines': ['* %? :EVENT:',
                      \     'SCHEDULED: <%(strftime(g:dotoo#time#date_day_format))> ',
		      \    ],
                      \  'target': 'schedule'
                      \ },
                      \ 'p': {
                      \   'description': 'Phone call',
                      \   'lines': ['* PHONE %? :PHONE:'],
                      \ },
                      \ 'h': {
                      \   'description': 'Habit',
                      \   'lines': [
                      \     '* NEXT %?',
                      \     'SCHEDULED: <%(strftime(g:dotoo#time#date_day_format)) >',
                      \     ':PROPERTIES:',
                      \     ':STYLE: habit',
                      \     ':REPEAT_TO_STATE: NEXT',
                      \     ':END:'
                      \   ]
                      \ }
                      \}

		      if !isdirectory(a:path . '/meeting.dotoo')
			      silent execute '!echo "\#+TITTLE: Meeting" > ' . a:path . '/meeting.dotoo'
		      endif

		      if !isdirectory(a:path . '/schedule.dotoo')
			      silent execute '!echo "\#+TITTLE: Schedule" > ' . a:path . '/schedule.dotoo'
		      endif

		      if !isdirectory(a:path . '/note.dotoo')
			      silent execute '!echo "\#+TITTLE: Note" > ' . a:path . '/note.dotoo'
		      endif
	endfunction

	let remote_server = 'Dropbox'
	let remote_dir =  M_get_remote_path(remote_server)

	if empty(remote_dir) == 0
		let dotoo_dir = 'dotoo'
		let remote_dir = remote_dir . '/' . dotoo_dir
		if !isdirectory(remote_dir)
			call mkdir(remote_dir, 'p')

			if !isdirectory(remote_dir)
				echoerr 'Could not create directory ' . remote_dir
			endif
		endif

		let g:dotoo#agenda#files = [ remote_dir . '/*.dotoo' ]
		let g:dotoo#capture#refile = expand(remote_dir . '/refile.dotoo')
		let g:dotoo#capture#clock = 1 " log how much time was spent doing them
		call s:Key_setup_vim_dotoo()
		call s:Template_dotoo(remote_dir)
	endif
endif
