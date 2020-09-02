set -xU EDITOR vim
set -xU VISUAL vim

set -x GOPATH $HOME/go
set -xg PATH $GOPATH/bin $PATH

function setup_alias
	alias rsync "rsync -c -r -p -E -X --partial-dir=.rsync-partial --stats -h -P "
	alias please "sudo "
	alias f fuck
	alias bench hyperfine
	alias select peco
	alias sel peco
	alias analyse ncdu

	if which http > /dev/null 2>&1
		alias curl "http --follow"
	end

	if which kitty > /dev/null 2>&1
		alias icat "kitty +kitty icat"
	end

	if which advcp > /dev/null 2>&1
		alias cp "advcp -g"
		alias mv "advmv -g"
	end

	if which rg > /dev/null 2>&1
		alias grep "rg -S --heading -C 1 --color auto --heading --line-number"
	end

	if which bat > /dev/null 2>&1
		alias cat bat
	end

	if which exa > /dev/null 2>&1
		alias ls "exa -l --git"
	end

	alias rm "rm -rf"
	alias tssh "ssh -o ProxyCommand='nc -x localhost:9050 %h %p'"
	alias tscp "scp -o ProxyCommand='nc -x localhost:9050 %h %p'"
	alias trsync "rsync --progress -e 'ssh -o ProxyCommand=\'nc -x localhost:9050 %h %p\''"
end

setup_alias &
thefuck --alias | source &

function install
	yay -S $argv --noconfirm
end

function fish_prompt
	powerline-go -error $status -colorize-hostname -shell bare -modules nix-shell,venv,user,host,ssh,cwd,perms,git,hg,jobs,exit,vgo -newline -hostname-only-if-ssh -mode compatible
end
