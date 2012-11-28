#!/bin/bash
cd "$(dirname "${BASH_SOURCE}")"
git pull
git submodule init
git submodule update
git submodule foreach git submodule init
git submodule foreach git submodule update

if [ ! -e $PWD/.vim/autoload ]
then
	ln -s $PWD/vim-pathogen/autoload $PWD/.vim/autoload
fi

function doIt() {
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" --exclude "README.md" -av . ~
}


if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	fi
fi
unset doIt
source ~/.bash_profile