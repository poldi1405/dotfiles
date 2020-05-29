#!/bin/env bash

PWD=$(dirname "$0")

cd "$PWD"
echo $PWD
git submodule update --init

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

read -r -p "i3 [Y/n] " input
case $input in
	[nN])
		;;
	*)
		yay -S i3-gaps-rounded-git feh rofi polybar i3status-rust-git zenity --noconfirm
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
		curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		vim +PlugInstall
		;;
esac
