# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# Initialise Starship Prompt
eval "$(starship init zsh)"

# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
# plug "zap-zsh/exa"
plug "zsh-users/zsh-syntax-highlighting"
plug "Freed-Wu/fzf-tab-source"
plug "zsh-users/zsh-history-substring-search"
plug "zap-zsh/completions"
plug "wintermi/zsh-brew"
plug "hlissner/zsh-autopair"
plug "MichaelAquilina/zsh-you-should-use"
plug "zap-zsh/fzf"
plug "zap-zsh/vim"
plug "qoomon/zsh-lazyload"
plug "b4b4r07/emoji-cli"

# Load and initialise completion system
autoload -Uz compinit
compinit

# source
plug "$HOME/.config/zsh/aliases.zsh"
plug "$HOME/.config/zsh/exports.zsh"
plug "$HOME/.config/zsh/sketchybar.zsh"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"