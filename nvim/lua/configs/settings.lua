vim.wo.number = true
vim.o.termguicolors = true
vim.o.mouse = 'a'
vim.cmd([[ set encoding=utf8 ]])
vim.cmd([[ set wildmenu ]])
vim.cmd([[ set confirm ]])
vim.cmd([[ set incsearch ]])
vim.cmd([[ set title ]])
vim.cmd([[ set t_Co=256 ]])
vim.cmd([[ set shiftwidth=2 ]])
vim.cmd([[ set softtabstop=2 ]])
vim.cmd([[ set expandtab ]])
vim.cmd([[ set shiftwidth=2 ]])
vim.cmd([[ set softtabstop=2 ]])
vim.cmd([[ set expandtab ]])
vim.cmd([[ set guicursor= ]])
vim.cmd([[ set cursorline ]])
vim.cmd([[ syntax on ]])

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

vim.cmd([[ colorscheme catppuccin ]])

-- Move swapfiles and backupfiles to ~/.cache
vim.o.directory = os.getenv('HOME') .. '/.cache/nvim'
vim.o.backup = true
vim.o.backupdir = os.getenv('HOME') .. '/.cache/nvim'

-- Enable undo features, even after closing vim
vim.o.undofile = true
vim.o.undodir = os.getenv('HOME') .. '/.cache/nvim'
vim.o.undolevels = 10000

