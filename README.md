# My dotfiles

## Installation

### Using chezmoi

I manage my configuration using [Chezmoi](https://chezmoi.io). To use it with
your chezmoi installation simply type

```
chezmoi init https://github.com/poldi1405/dotfiles.git && chezmoi apply
```
in your terminal-emulator and hit enter.

**This will overwrite your current configurations!**

#### Updating

`chezmoi update`

### Manually

`git clone` this repo to whereever you want to (~/.dotfiles for example)

```
git clone https://github.com/poldi1405/dotfiles.git ~/.dotfiles
```

and move the dotfiles around/symlink them as you want

- `dot_*` goes into `~`
- `private_dot_config/*` goes into `~/.config`

#### Updating

`cd ~/.dotfiles && git pull`

## Note

This might be fairly obvious but you have to setup your system accordingly. A
lot of things should be covered by the install-packages script but thats not
guaranteed. If you encounter errors after installing using the script please
tell me by opening an issue.

## Keybindings

I tried to be consistent butdue to limitations inside programs i cant garantee
that these work all the time. However: these should work most of the time. For
in-depth information on what keybindings are available in a specific program,
simply read the documentation of said program and read the applied config.

| Shortcut | What it does              | How to memorise it |
|----------|---------------------------|--------------------|
| `t``r`   | go to the tab to the left | `t` for tab, `r` is the key left of it|
| `t``z`   | go to the tab to the right| see above          |
| `t``n`   | open new tab              | `t`, `n` for new   |
| `t``c`   | close the current tab     | `t`, `c` for close |
| `t``s``r`| move tab to the left      | `t`, `s` for shift, `r`|
| `t``s``z`| move tab to the right     | see above          |
| `t``<0-9>`| switch to tab [number]   | `t`, number x      |
| arrow-keys| as an alias of hjkl      | look at the **ARROW** keys|

plus some more... maybe I'll make a complete list when I'm procrastinating.

### What's wrong with you? These key-bindings are mental!

![You get used to it Meme](https://web.archive.org/save/_embed/https://pbs.twimg.com/media/DpR84lqVAAAfx3l.jpg)
