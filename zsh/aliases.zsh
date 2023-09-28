alias b="bat --theme='Catppuccin-macchiato'"
# DNF Fedora
alias dnfi="sudo dnf install"
alias dnfu="sudo dnf update"

#Nvim
alias v="nvim"

#FD replace FIND
alias find="fd"

# Aliases for common dirs
alias home="z ~"

# Exa codes
alias la="eza -a --icons --hyperlink --group-directories-first"
alias ls="eza -l --icons --hyperlink --group-directories-first"
alias lsa="eza -la --icons --hyperlink --group-directories-first"
# System Aliases
alias ..="z .."
alias x="exit"

# Git Aliases
alias add="git add"
alias commit="git commit"
alias pull="git pull"
alias stat="git status"
alias gdiff="git diff HEAD"
alias vdiff="git difftool HEAD"
alias log="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias cfg="git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
alias push="git push"
alias g="lazygit"

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'
alias rmf='rm -rf'
# easier to read disk
alias df='df -h'     # human-readable sizes
alias free='free -m' # show sizes in MB

# get top process eating memory
alias psmem='ps auxf | sort -nr -k 4 | head -5'

# get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3 | head -5'

