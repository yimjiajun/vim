#!/bin/bash

vim_path="$HOME/.config/vim"
vim_init_file="init.vim"

function get_package_install_cmd {
	if [[ $OSTYPE == "linux-gnu" ]]; then
		echo "sudo apt install -y "
	elif [[ $OSTYPE == "darwin"* ]]; then
		echo "brew install "
	else
		echo "echo"
	fi
}

function python_install {
	echo "Installing python3 ..."
	install_cmd=$(get_package_install_cmd)
	$install_cmd python3
	$install_cmd python3-pip
	$install_cmd python3-venv
}

function linux_dev_lib_install {
	echo "Installing linux dev lib ..."
	install_cmd=$(get_package_install_cmd)
	$install_cmd build-essential
	$install_cmd libncurses-dev
}

function build_essential_install {
	echo "Installing build essential ..."
	install_cmd=$(get_package_install_cmd)
	$install_cmd --no-install-recommends git cmake ninja-build gperf \
		ccache dfu-util device-tree-compiler wget \
		python3-dev python3-pip python3-setuptools python3-tk python3-wheel xz-utils file \
		make gcc gcc-multilib g++-multilib libsdl2-dev libmagic1
	$install_cmd ninja-build gettext cmake unzip curl
}

function vim_install {
	echo "Installing vim ..."
	url='https://github.com/vim/vim.git'
	path='/tmp/vim'

	if [[ -d $path ]]; then
		remote_url=$(git -C $path remote get-url origin)
		remote_url=${remote_url%$'\n'}
		if [[ $remote_url = $url ]]; then
			echo "Vim already installed"
		else
			echo "remove ..."
			# rm -rf $path
		fi
	fi

	if ! [[ -d $path ]]; then
		echo "git clone $url $path"
	fi

	cd $path/src
	./configure --enable-python3interp=yes --enable-pythoninterp=yes
	make
	sudo make install
	echo -e "\033[33m================================\033[0m"
	echo -e "\033[33m Restart Terminal to use Vim ...\033[0m"
	echo -e "\033[33m================================\033[0m"

	if ! [[ -d $vim_path ]]; then
		echo -e "\033[33mvim configuration path not on defualt path ! \033[0m"
		read -p ">> Enter vim configuration path : " vim_path

		if [[ -z $vim_path ]]; then
			echo -e "\033[31merror: Provided empty path !\033[0m"
			exit 1
		elif ! [[ -d $vim_path ]]; then
			echo -e "\033[31merror: Provided path not exist !\033[0m"
			exit 1
		fi
	fi

	if [[ $(grep "VIMINIT" -wc ${HOME}/.$(basename $SHELL)rc) -ne 0 ]]; then
		echo -e "\033[33mVIMINIT already exist !\033[0m"
		echo ">>"
		grep "VIMINIT" -w ${HOME}/.$(basename $SHELL)rc
		echo "<<"
	else
		echo "export VIMINIT='source $vim_path/$vim_init_file'" >> ${HOME}/.$(basename $SHELL)rc
	fi

	$SHELL -c "source ${HOME}/.$(basename $SHELL)rc"

	echo -e "\033[33m================================\033[0m"
	echo -e "\033[33m Vim Startup configuration path:\033[0m"
	echo -e "\033[33m > $vim_path\033[0m"
	echo -e "\033[33m VIMINIT:\033[0m"
	echo -e "\033[33m > $(grep "VIMINIT" -w ${HOME}/.$(basename $SHELL)rc) \033[0m"
	echo -e "\033[33m================================\033[0m"

	vim +PlugInstall +qall
	vim +'call Install_all()' +qall
}

function main {
	python_install
	linux_dev_lib_install
	build_essential_install
	vim_install
}

main "$@"

exit 0
