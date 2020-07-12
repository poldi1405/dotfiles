#!/bin/env bash

read -r -p "sublime-merge [Y/n] " input
case $input in
	[nN])
		;;
	*)
		grep sublimetext.com /etc/pacman.conf > /dev/null
		if [ $? == 0 ]; then
			echo "already applied… skipping"
		else
			echo -ne "\n\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf > /dev/null
			sudo pacman -Sy sublime-merge --noconfirm
		fi
esac
		
read -r -p "mp-pachost [Y/n] " input
case $input in
	[nN])
		;;
	*)
		grep pachost.moritz.sh /etc/pacman.conf > /dev/null
		if [ $? == 0 ]; then
			echo "already applied… skipping"
		else
			echo -ne "\n\n[mp-pachost]\nServer = https://pachost.moritz.sh/" | sudo tee -a /etc/pacman.conf > /dev/null
			sudo pacman -Sy sublime-merge --noconfirm
		fi
esac

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
		yay -S i3 feh rofi polybar i3status-rust-git zenity --noconfirm
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
		yay -S ctags --noconfirm
		curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		vim +PlugInstall +GoInstallBinaries +qall
		;;
esac

read -r -p "sudo [Y/n] " input
case $input in
	[nN])
		;;
	*)
		echo "not yet working… not applied!"
		#echo -ne "\n\nDefaults !tty_tickets\nDefaults passwd_timeout=0" | sudo tee -a /etc/sudoers > /dev/null
		;;
esac
