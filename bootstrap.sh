#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")"
git pull
git submodule init
git submodule update
git submodule foreach git submodule init
git submodule foreach git submodule update
git pull origin master
function doIt() {
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
		--exclude "README.md" --exclude "LICENSE-MIT.txt" -av --no-perms . ~
	ln -s $HOME/.vim/vimrc $HOME/.vimrc
	vim "+mkspell ~/.vim/spell/custom.en.utf-8.add" +BundleInstall +qall
cd $HOME/.vim/bundle/YouCompleteMe
./install.sh --clang-completer
	source ~/.bash_profile
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
