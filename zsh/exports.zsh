#!/bin/sh
# HISTFILE="$XDG_DATA_HOME"/zsh/history
HISTSIZE=1000000
SAVEHIST=1000000
export EDITOR="nvim"
export TERMINAL="kitty"
export PATH="$HOME/.local/bin":$PATH
export MANPAGER='nvim +Man!'
export MANWIDTH=999
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.local/share/go/bin:$PATH
export GOPATH=$HOME/.local/share/go
export PATH=$HOME/.fnm:$PATH
export PATH="$HOME/.local/share/neovim/bin":$PATH
export XDG_CURRENT_DESKTOP="Wayland"
export PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"
export PATH=~/.npm-global/bin:$PATH
#export PATH="$PATH:./node_modules/.bin"
#eval "$(fnm env)"
#eval "$(zoxide init zsh)"
# eval "`pip completion --zsh`"
export ZSH_COMPDUMP="$HOME/.config/zsh/zcom/.zcompdump"
eval "$(zoxide init zsh)"
