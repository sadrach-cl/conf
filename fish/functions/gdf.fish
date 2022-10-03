function gdf --wraps='git diff' --description 'alias gdf=git diff'
  git diff $argv; 
end
