-- For nvim-web-devicons
require'nvim-web-devicons'.get_icons()

-- FOR THE COLORIZER
require'colorizer'.setup()

-- For Lualine
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}


-- FOR THE INDENTATION LINES
vim.opt.listchars:append("space:⋅")
--vim.opt.listchars:append("eol:↴")
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#F28FAD gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#FAE3B0 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#ABE9B3 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#96CDFB gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#89DCEB gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#DDB6F2 gui=nocombine]]

vim.cmd([[
  hi! MatchParen cterm=NONE,bold gui=NONE,bold guibg=NONE guifg=#D9E0EE
  let g:indentLine_fileTypeExclude = ['dashboard']
]])

require("indent_blankline").setup {
    show_end_off_line = true,
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}
