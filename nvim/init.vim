:set termguicolors
:set number
:set relativenumber
call plug#begin()

"Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'
Plug 'itchyny/lightline.vim'
Plug 'https://github.com/preservim/nerdtree'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'norcalli/nvim-colorizer.lua'


call plug#end()

luafile $HOME/.config/nvim/lua/plug-colorizer.lua

" Vim Script
colorscheme catppuccin

let g:lightline = {
			\ 'colorscheme': 'catppuccin',
     \ }

