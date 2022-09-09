vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
 
  -- Catppuccin Theme
  use({
	"catppuccin/nvim",
	as = "catppuccin"
  })

  -- Telescope Spotlight para nvim. 
  use {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} }
  }

  --explorador
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function() require'nvim-tree'.setup {} end
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

  
  --Scroll barra lateral
  use 'dstein64/nvim-scrollview'

  
  use 'tpope/vim-surround'
  
  --coloca un par de llaves al teclear la primera
  use 'windwp/nvim-autopairs'
 
  -- No cacho mucho que wea hace esto
  use {
     'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
    }


  use "terrortylor/nvim-comment"
  require('nvim_comment').setup()--use_rocks 'penlight'
  --use_rocks 'lfs'
  use_rocks {'lua-resty-http', 'lpeg'}

  use {
        'neovim/nvim-lspconfig',
        'williamboman/nvim-lsp-installer',
        --'hrsh7th/cmp-nvim-lsp-signature-help',
        --'ray-x/lsp_signature.nvim'
    }

  
  -- Completition
  use {
        "hrsh7th/nvim-cmp",
        requires = {
             "hrsh7th/cmp-buffer",
             "hrsh7th/cmp-path",
             "hrsh7th/cmp-nvim-lua",
             "hrsh7th/cmp-nvim-lsp",
             "saadparwaiz1/cmp_luasnip",
             "onsails/lspkind-nvim",
            "L3MON4D3/LuaSnip",
        }
      }
  
  use {
  'kdheepak/tabline.nvim',
  config = function()
    require'tabline'.setup {
      -- Defaults configuration options
      enable = true,
      options = {
      -- If lualine is installed tabline will use separators configured in lualine by default.
      -- These options can be used to override those settings.
        section_separators = {'', ''},
        component_separators = {'', ''},
        max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
        show_tabs_always = false, -- this shows tabs only when there are more than one tab or if the first tab is named
        show_devicons = true, -- this shows devicons in buffer section
        show_bufnr = false, -- this appends [bufnr] to buffer section,
        show_filename_only = false, -- shows base filename only instead of relative path in filename
        modified_icon = "+ ", -- change the default modified icon
        modified_italic = false, -- set to true by default; this determines whether the filename turns italic if modified
      }
    }
    vim.cmd[[
      set guioptions-=e " Use showtabline in gui vim
      set sessionoptions+=tabpages,globals " store tabpages and globals in session
    ]]
  end,
  requires = { { 'hoob3rt/lualine.nvim', opt=true }, {'kyazdani42/nvim-web-devicons', opt = true} }
}    
end)



