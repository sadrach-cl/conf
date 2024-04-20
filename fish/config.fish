if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
    set -x VISUAL nvim
    # alias -s v="nvim -i NONE"
    # alias -s del="yay -R"  
    # alias -s gcom="git commit -m"
    # alias -s gadd="git add ."
    # alias -s gpk="git pull"
    # alias -s gps="gut push"
    # alias -s gch="git checkout"
    # alias -s mkdir="mkdir -p"
    # alias -s rm="rm -rv"
    # alias -s la="exa --long --all --group --header --group-directories-first --sort=type --icons"
    # alias -s lg="exa --long --all --group --header --git"
    # alias -s lt="exa --long --all --group --header --tree --level "
    # alias -s vdir="vdir --color=auto"
    # alias -s gadc="git add -A; and git commit"
    # alias -s gdf="git diff"
    # alias -s gl="git log"
    # alias -s glg="git log --color --graph --pretty --oneline"
end

zoxide init fish | source
set PATH /opt/homebrew/bin $PATH
