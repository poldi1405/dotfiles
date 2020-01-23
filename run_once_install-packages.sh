#!/bin/env bash

read -r -p "Are you on an Arch-based System? (e.g. Manjaro, Arch, etc.) [Y/n] " input
case $input in
	[nN])
		echo "Good luck, you're on your own then."
		exit
		;;
	*)
		if yay --help 2>/dev/null 1>&2; then
			echo "And you've got yay installed! Good boy!"
		else
			echo "But no yay? Well... we can change that."
			git clone https://aur.archlinux.org/yay.git /tmp/yay
			cd /tmp/yay
			makepkg -si
		fi
		;;
esac

echo Which configs will be used?

read -r -p "fish [Y/n] " input
case $input in
	[nN])
		;;
	*)
		yay -S bat exa fd fish go httpie hyperfine ncdu peco pkgfile ripgrep rsync thefuck tldr --noconfirm
		sudo pkgfile --update
		go get -u -v github.com/justjanne/powerline-go
		;;
esac

read -r -p "i3status-rust [Y/n] " input
case $input in
	[nN])
		;;
	*)
		yay -S i3status-rust-git --noconfirm
		;;
esac

read -r -p "neomutt [Y/n] " input
case $input in
	[nN])
		;;
	*)
		sudo pacman -S neomutt pandocs bat zathura --noconfirm
		yay -S firewarden --noconfirm
		;;
esac

read -r -p "vim [Y/n] " input
case $input in
	[nN])
		;;
	*)
		rm -rf ~/.vim/bundle/Vundle.vim
		git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
		sudo pacman -S base-devel cmake python vim --noconfirm
		vim +PluginInstall +GoInstallBinaries +qall
		cd ~/.vim/bundle/YouCompleteMe
		python3 install.py --clang-completer --cs-completer --go-completer
		;;
esac
