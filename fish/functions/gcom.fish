function gcom --wraps='git commit -m' --description 'alias gcom=git commit -m'
  git commit -m $argv; 
end
