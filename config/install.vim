if executable('curl') == '0'
	system('sudo apt install -y curl')
endif

if executable('nodejs') == '0' && g:loeded_coc == '1'
	system('curl -sL install-node.vercel.app/lts | bash')
endif
