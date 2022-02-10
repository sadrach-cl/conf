-- init.lua
vim.opt.mouse = 'a'
vim.opt.tabstop = 4
vim.opt.number = true
vim.opt.shortmess = vim.opt.shortmess + 'c'

-- init.lua
-- Auto install if not exist
--local install_path = fn.stdpath('data')..'/site/pack/paqs/opt/paq-nvim'

--if fn.empty(fn.glob(install_path)) > 0 then
--  cmd('!git clone --depth 1 https://github.com/savq/paq-nvim.git '..install_path)
--end

-- Load the plugin manager
cmd 'packadd paq-nvim'

-- Set the short hand
local plug = require('paq-nvim').paq

-- Make paq manage it self
plug {'savq/paq-nvim', opt=true}

