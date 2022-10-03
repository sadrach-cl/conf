function upg --wraps='yay -Syu' --description 'alias upg=yay -Syu'
  yay -Syu $argv; 
end
