set -U EDITOR vim
set -U VISUAL vim

set -x GOPATH $HOME/go
set -xg PATH $GOPATH/bin $PATH

alias rsync "rsync -c -r -p -E -X --partial-dir=.rsync-partial --stats -h -P "
alias cat bat
alias please "sudo "
alias ls "exa -l --git"
alias f fuck
alias bench hyperfine
alias grep "rg -S --heading -C 1 --color auto --heading --line-number"
alias select peco
alias sel peco
alias analyse ncdu
alias curl "http --follow"
alias icat "kitty +kitty icat"
alias cp "advcp -g"
alias mv "advmv -g"
alias rm "rm -rf"
alias kwww "knock -v -d 100 www2.45n43b.xyz 666 1405 1912 22"
alias klfs "knock -v -d 100 lfs.45n43b.xyz 9639 623 420 22"
alias tssh "ssh -o ProxyCommand='nc -x localhost:9050 %h %p'"
alias tscp "scp -o ProxyCommand='nc -x localhost:9050 %h %p'"
alias trsync "rsync --progress -e 'ssh -o ProxyCommand=\'nc -x localhost:9050 %h %p\''"

thefuck --alias | source

function fish_prompt
	powerline-go -error $status -shell bare -modules nix-shell,venv,user,host,ssh,cwd,perms,git,hg,jobs,exit,vgo -newline
end
