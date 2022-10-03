function gadd --wraps='git add .' --description 'alias gadd=git add .'
  git add . $argv; 
end
