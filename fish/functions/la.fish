function la --wraps='exa --long --all --group --header --group-directories-first --sort=type --icons' --description 'alias la=exa --long --all --group --header --group-directories-first --sort=type --icons'
  exa --long --all --group --header --group-directories-first --sort=type --icons $argv; 
end
