vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
 
  -- Catppuccin Theme
  use({
	"catppuccin/nvim",
	as = "catppuccin"
  })

  -- Telescope (aun no se que hace)
  use {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} }
  }

  --Colorizer colores dentro de los codigos exa
  use 'norcalli/nvim-colorizer.lua'

  -- Web icons para nvim, fuentes
  use 'kyazdani42/nvim-web-devicons'

  -- Lineas de colores para seguir orden gerarquico de archivos
  use 'lukas-reineke/indent-blankline.nvim'

  -- Lualine barra de estado inferior
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
end)
