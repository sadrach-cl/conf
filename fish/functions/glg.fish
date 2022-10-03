function glg --wraps='git log --color --graph --pretty --oneline' --description 'alias glg=git log --color --graph --pretty --oneline'
  git log --color --graph --pretty --oneline $argv; 
end
