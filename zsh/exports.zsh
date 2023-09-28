#!/bin/sh
HISTFILE="$HOME"/.config/zsh/history
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
# export XDG_CURRENT_DESKTOP="Wayland"
export PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"
export PATH=~/.npm-global/bin:$PATH
#export PATH="$PATH:./node_modules/.bin"
#eval "$(fnm env)"
# eval "`pip completion --zsh`"
export ZSH_COMPDUMP="$HOME/.config/zsh/zcom/"
eval "$(zoxide init zsh)"
export FZF_DEFAULT_OPTS=" \
--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"
