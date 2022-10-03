function gadc --wraps='git add -A; and git commit' --description 'alias gadc=git add -A; and git commit'
  git add -A; and git commit $argv; 
end
